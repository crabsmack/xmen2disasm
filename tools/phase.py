"""Measure a phase's definition of done (docs/ROADMAP.md); write docs/progress/PN.md.

    uv run tools/phase.py 2            # phase 2 (recomp); also 3, 4, 5
    uv run tools/phase.py 2 --fresh    # ignore cached trace results
    uv run tools/phase.py 2 --json
    uv run tools/phase.py 5 --draft    # measure past an unapproved kickoff (D0/P0); never exits 0
    uv run tools/phase.py 1            # = tools/progress.py
    uv run tools/phase.py status       # last recorded result of every phase

Exit 0 only when every criterion of the phase passes. The first failing criterion is the
autonomous loop's next job. Criteria live in docs/phases/PN-*.md; this file is their
measurement. Never weaken a check here to make it pass: changing a criterion needs the
user's approval, recorded in the phase doc.

Phases 2, 4 and 5 run contract commands in the game repo ($XMEN2_RECOMP, default
../XMen2Recomp next to the main checkout; contract in docs/phases/P2-recomp.md) and
compare their traces against this repo's reference runs (emu/runs/<run>/frames.csv).
"""
from __future__ import annotations

import argparse
import csv
import json
import os
import re
import shutil
import subprocess
import sys
import threading
import time
import tomllib
from concurrent.futures import ThreadPoolExecutor
from datetime import date
from pathlib import Path

import build

ROOT = build.ROOT
COMPARED = ["ram_crc32", "vram_crc32", "cram_crc32", "vsram_crc32"]
REPORTED = ["z80_crc32"]
BOOT_FRAMES = 600
MIN_FPS = 120.0
LIB_ROUTINES = ["Mem_Copy", "Mem_Set", "Math_LMul", "Math_LDivS", "Math_LModS",
                "Math_DivModS", "Math_DivModU"]
FAMILIES = ["mpw-c", "mpw-sc", "think-c", "symantec-cpp", "codewarrior-68k"]
POLICIES = ["matching-for-unexecuted", "matching-all", "functional"]
LINT_RULES = ["registers", "raw_addresses", "raw_offsets", "cross_function_goto"]
ROM_EXT = re.compile(r"\.(bin|gen|smd)$", re.I)
DATE = r"\d{4}-\d{2}-\d{2}"
DOCS = {2: "P2-recomp.md", 3: "P3-compiler.md", 4: "P4-decomp.md", 5: "P5-port.md"}
PHASE_NAMES = {1: "disassembly", 2: "recomp", 3: "compiler", 4: "decomp", 5: "port"}

Result = tuple[str, bool, str]


# --- locations ---------------------------------------------------------------------------

def main_checkout() -> Path:
    r = subprocess.run(["git", "rev-parse", "--path-format=absolute", "--git-common-dir"],
                       cwd=ROOT, capture_output=True, text=True)
    return Path(r.stdout.strip()).parent if r.returncode == 0 else ROOT


def recomp_root() -> Path:
    return Path(os.environ.get("XMEN2_RECOMP") or main_checkout().parent / "XMen2Recomp")


def runs_dir() -> Path:
    here = ROOT / "emu" / "runs"
    return here if (here / "tas" / "frames.csv").exists() else main_checkout() / "emu" / "runs"


def functions() -> list[dict]:
    with open(ROOT / "build" / "recomp" / "functions.csv", newline="") as f:
        return list(csv.DictReader(f))


_RUNS: list[str] = []


def corpus_runs() -> list[str]:
    if not _RUNS:
        sys.path.insert(0, str(ROOT / "emu"))
        import corpus  # noqa: E402
        _RUNS.extend(n for n, _ in corpus.corpus())
    return _RUNS


# --- subprocess helpers ------------------------------------------------------------------

def git(repo: Path, *args: str) -> str:
    if not repo.is_dir():
        return ""
    r = subprocess.run(["git", *args], cwd=repo, capture_output=True, text=True)
    return r.stdout.strip() if r.returncode == 0 else ""


def uv_run(cwd: Path, *args: str, timeout: int = 7200) -> subprocess.CompletedProcess:
    uv = shutil.which("uv")
    cmd = [uv, "run", *args] if uv else [sys.executable, *args]
    env = {k: v for k, v in os.environ.items() if k != "VIRTUAL_ENV"}  # each repo uses its own .venv
    try:
        return subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, timeout=timeout, env=env)
    except subprocess.TimeoutExpired:
        return subprocess.CompletedProcess(cmd, 124, "", f"timeout after {timeout}s")


def parse_json(out: str):
    i = out.find("{")
    if i < 0:
        return None
    try:
        return json.loads(out[i:])
    except ValueError:
        return None


def contract(*args: str, timeout: int = 7200) -> tuple[dict | None, str]:
    """Run `tools/xmen2check.py ARGS --json` in the game repo -> (json, error)."""
    root = recomp_root()
    tool = root / "tools" / "xmen2check.py"
    if not tool.exists():
        return None, f"{tool} missing (contract: docs/phases/P2-recomp.md)"
    r = uv_run(root, "tools/xmen2check.py", *args, "--json", timeout=timeout)
    data = parse_json(r.stdout)
    if r.returncode != 0 or data is None:
        shown = " ".join(a for a in args if "/" not in a and "\\" not in a)  # paths only add noise
        tail = " ".join((r.stdout + r.stderr)[-300:].split())
        return None, f"xmen2check.py {shown} failed ({r.returncode}): {tail[-200:]}"
    return data, ""


def gh_json(path: str, jq: str) -> str:
    r = subprocess.run(["gh", "api", path, "--jq", jq], capture_output=True, text=True)
    return r.stdout.strip() if r.returncode == 0 else ""


# --- trace comparison --------------------------------------------------------------------

def read_frames(path: Path, key: str = "frame") -> tuple[list[str], dict[int, dict[str, str]]]:
    with open(path, newline="") as f:
        rd = csv.DictReader(f)
        rows = {int(r[key]): r for r in rd}
        return list(rd.fieldnames or []), rows


def export_input(run: str, out_dir: Path) -> tuple[Path | None, str]:
    out_dir.mkdir(parents=True, exist_ok=True)
    inp = out_dir / f"{run}.input"
    e = uv_run(ROOT, "emu/export_input.py", run, "--out", str(inp), timeout=600)
    if e.returncode != 0 or not inp.exists():
        return None, f"export_input.py {run} failed: {(e.stdout + e.stderr)[-200:]}"
    return inp, ""


# The corpus runs are independent traces (own output and runner directories): this many at once
# (a runner takes ~80 MB and a fraction of a core).
JOBS = int(os.environ.get("PHASE_JOBS", "24"))


def run_frames(run: str) -> int:
    """Frames a corpus run's exported input covers (the sum of its WAITs; 0 before the export)."""
    p = ROOT / "build" / "phase_traces" / f"{run}.input"
    if not p.exists():
        return 0
    return sum(int(m.group(1), 0) for m in re.finditer(r"^WAIT\s+(\S+)", p.read_text(), re.M))


def pmap(fn, items: list) -> list:
    """fn over items on JOBS threads (each runs a subprocess); results in the items' order. Corpus
    runs (names) start longest first, so the last to finish are short ones."""
    cost = {i: run_frames(i) if isinstance(i, str) else 0 for i in items}
    with ThreadPoolExecutor(max_workers=max(1, JOBS)) as ex:
        futs = {i: ex.submit(fn, i) for i in sorted(items, key=lambda i: -cost[i])}
        return [futs[i].result() for i in items]


class Traces:
    """Runs contract traces for (run, mode, frames), compares with the reference, caches.

    The reference is the gpgx run's frames.csv (by frame), or with ref_sync a D1 sync.csv
    (by sync point; phase 4). timed_key=True caches by the last game-repo commit outside the
    hand-C tree (game/c, game/include, docs, and the bridge and runtime only the hand-C runners
    link: tools/bridge.py, game/runtime/handc_rt.cpp, asm_conv.cpp, verify.cpp; game/verify, the
    shadow tests' synthetic cases), for traces that don't build hand C."""

    def __init__(self, fresh: bool):
        self.cache_path = ROOT / "build" / "phase_cache.json"
        self.cache = {} if fresh or not self.cache_path.exists() else json.loads(self.cache_path.read_text(encoding="utf-8"))
        root = recomp_root()
        head, engine = git(root, "rev-parse", "HEAD"), git(root / "segagenesisrecomp", "rev-parse", "HEAD")
        porcelain = git(root, "status", "--porcelain").splitlines()
        dirty = bool(porcelain)
        self.rev = None if dirty or not head else f"{head}:{engine}"
        hand_c = ("game/c", "game/include", "docs", "tools/bridge.py", "game/runtime/handc_rt.cpp",
                  "game/runtime/asm_conv.cpp", "game/runtime/verify.cpp", "game/verify")
        timed = git(root, "log", "-1", "--format=%H", "--", ".", *(f":(exclude){p}" for p in hand_c))
        # traces that don't build hand C only need the rest of the tree clean (C being written
        # in game/c meanwhile doesn't change them)
        dirty_timed = any(not re.match(r"..\s*\"?(game/c/|game/include/|game/verify/|docs/|tools/bridge\.py|"
                                       r"game/runtime/(handc_rt|asm_conv|verify)\.cpp)", l) for l in porcelain)
        self.rev_timed = None if dirty_timed or not timed else f"{timed}:{engine}"
        self.out_dir = ROOT / "build" / "phase_traces"
        self.lock = threading.RLock()   # traces run on pmap's threads; the cache is shared

    def save(self) -> None:
        with self.lock:
            self.cache_path.parent.mkdir(parents=True, exist_ok=True)
            self.cache_path.write_text(json.dumps(self.cache, indent=1), encoding="utf-8")

    def run(self, run: str, mode: str, frames: int | None = None, extra: tuple[str, ...] = (),
            use_cache: bool = True, ref_sync: Path | None = None, timed_key: bool = False,
            rev: str | None = None) -> dict:
        """rev: the cache revision to use instead of the game repo's (phase 5: the runner's hash)."""
        ref = ref_sync or runs_dir() / run / "frames.csv"
        if not ref.exists():
            return {"ok": False, "detail": f"no reference {ref}" + ("" if ref_sync else " (run emu/corpus.py)")}
        key = f"{run}|{mode}|{frames}|{' '.join(extra)}|{ref.stat().st_mtime_ns}"
        rev = rev or (self.rev_timed if timed_key else self.rev)
        with self.lock:
            hit = self.cache.get(key)
        if use_cache and hit and rev and hit.get("rev") == rev:
            return hit
        res = self._run(run, mode, frames, extra, ref, ref_sync is not None)
        if rev:
            with self.lock:
                self.cache[key] = {**res, "rev": rev}
                self.save()
        return res

    def _run(self, run, mode, frames, extra, ref_csv, sync: bool) -> dict:
        if sync:
            ref = read_frames(ref_csv, "sync")[1]
        else:
            cols, ref = read_frames(ref_csv)
            lacking = [c for c in COMPARED + REPORTED if c not in cols]
            if lacking:
                return {"ok": False, "detail": f"reference {run} lacks {', '.join(lacking)} (K2)"}
        if not (recomp_root() / "tools" / "xmen2check.py").exists():
            return {"ok": False, "detail": "game repo has no tools/xmen2check.py (contract: P2-recomp.md)"}
        inp, err = export_input(run, self.out_dir)
        if inp is None:
            return {"ok": False, "detail": err}
        # a cut run (--frames) gets its own directory: it never replaces the whole run's outputs
        out = self.out_dir / "-".join([run, mode, *(Path(x).name.strip("-") for x in extra),
                                       *([f"f{frames}"] if frames else [])])
        if out.exists():
            shutil.rmtree(out)
        args = ["trace", "--run", run, "--input", str(inp), "--out", str(out), "--mode", mode, *extra]
        if frames:
            args += ["--frames", str(frames)]
        stats, err = contract(*args)
        if stats is None:
            return {"ok": False, "detail": err}
        if sync:
            return self._compare_sync(ref, out / "sync.csv", stats, limit=frames)
        if not (out / "frames.csv").exists():
            return {"ok": False, "detail": f"trace wrote no {out / 'frames.csv'}"}
        got_cols, got = read_frames(out / "frames.csv")
        want = sorted(f for f in ref if frames is None or f <= frames)  # reference frames count from 1
        first = None
        for f in want:
            g = got.get(f)
            if g is None:
                first = (f, "frame missing from trace")
                break
            bad = [c for c in COMPARED if c not in g or g[c].lower() != ref[f][c].lower()]
            if bad:
                first = (f, ", ".join(bad))
                break
        detail = (f"{len(want)} frames equal" if first is None else f"first divergence frame {first[0]}: {first[1]}")
        for c in REPORTED:
            n = sum(1 for f in want if f in got and got[f].get(c, "").lower() != ref[f][c].lower())
            detail += f"; {c} differs on {n} frames (reported only)"
        return {"ok": first is None, "detail": detail, "stats": stats, "frames": len(want),
                "csv": str(out / "frames.csv")}

    def plain(self, run: str, mode: str, extra: tuple[str, ...] = (), timed_key: bool = False,
              rev: str | None = None) -> dict:
        """A contract trace whose sync.csv is itself a reference (phase 4: stepped-gen), not
        compared with anything. Cached per revision like run()."""
        key = f"{run}|{mode}|plain|{' '.join(extra)}"
        rev = rev or (self.rev_timed if timed_key else self.rev)
        with self.lock:
            hit = self.cache.get(key)
        if hit and rev and hit.get("rev") == rev and Path(hit.get("csv", "")).exists():
            return hit
        inp, err = export_input(run, self.out_dir)
        if inp is None:
            return {"ok": False, "detail": err}
        # flags other than --replay get their own directory (phase 5: --fb), so a variant never
        # deletes the plain reference another criterion compares with
        out = self.out_dir / "-".join([f"{run}-{mode}", *(x.strip("-") for x in extra
                                                          if x.startswith("--") and x != "--replay")])
        if out.exists():
            shutil.rmtree(out)
        stats, err = contract("trace", "--run", run, "--input", str(inp), "--out", str(out), "--mode", mode, *extra)
        csv_path = out / "sync.csv"
        ok = stats is not None and csv_path.exists()
        res = {"ok": ok, "detail": err or f"{(stats or {}).get('sync_points')} sync points", "stats": stats,
               "csv": str(csv_path)}
        if rev and ok:
            with self.lock:
                self.cache[key] = {**res, "rev": rev}
                self.save()
        return res

    @staticmethod
    def _compare_sync(ref: dict[int, dict[str, str]], got_csv: Path, stats: dict, limit: int | None = None) -> dict:
        """Phase 4: every sync point of the reference, same index, same compared CRCs; no extras.
        limit (a run cut to its first N sync points, phase 5's smoke test): the reference's first N."""
        if not got_csv.exists():
            return {"ok": False, "detail": f"trace wrote no {got_csv}", "stats": stats}
        got = read_frames(got_csv, "sync")[1]
        if limit:   # the runner's first `limit` frames hold about that many sync points: compare those
            if not got or max(got) < limit - 1:
                return {"ok": False, "detail": f"cut run wrote {len(got)} sync points (asked {limit})", "stats": stats}
            ref = {s: r for s, r in ref.items() if s <= max(got)}
            got = {s: g for s, g in got.items() if s in ref}
        first = None
        for s in sorted(ref):
            g = got.get(s)
            if g is None:
                first = (s, "sync point missing from trace")
                break
            bad = [c for c in COMPARED if c not in g or g[c].lower() != ref[s][c].lower()]
            if bad:
                first = (s, ", ".join(bad))
                break
        if first is None and len(got) != len(ref):
            first = (max(ref, default=0) + 1, f"trace has {len(got)} sync points, reference {len(ref)}")
        detail = (f"{len(ref)} sync points equal" if first is None else
                  f"first divergence sync {first[0]} (reference frame {ref.get(first[0], {}).get('frame', '?')}): {first[1]}")
        return {"ok": first is None, "detail": detail, "stats": stats, "frames": len(ref), "csv": str(got_csv)}


def trace_criteria(cid_one: str, cid_all: str, cid_clean: str | None, mode: str, tr: Traces,
                   crit, extra: tuple[str, ...] = ()) -> None:
    """Whole TAS (cid_one), its fallback counters (cid_clean), every corpus run (cid_all)."""
    tas = tr.run("tas", mode, None, extra)
    crit(cid_one, tas["ok"], f"tas: {tas['detail']}")
    if cid_clean:
        s = tas.get("stats") or {}
        counts = {k: s.get(k) for k in ("dispatch_misses", "interp_instructions", "stub_hits")}
        ok = tas["ok"] and all(v == 0 for v in counts.values())
        crit(cid_clean, ok, ", ".join(f"{k} {v}" for k, v in counts.items()) if s else "no tas trace stats")
    bad = []
    runs = corpus_runs()
    for run, r in zip(runs, pmap(lambda run: tr.run(run, mode, None, extra), runs)):
        s = r.get("stats") or {}
        if not r["ok"] or s.get("dispatch_misses") or s.get("interp_instructions") or s.get("stub_hits"):
            bad.append(f"{run} ({r['detail'][:80]})")
    n = len(corpus_runs())
    crit(cid_all, not bad, f"{n - len(bad)}/{n} corpus runs equal" + (f"; first: {bad[0]}" if bad else ""))


# --- phase 2: recomp ---------------------------------------------------------------------

def phase2(crit, fresh: bool) -> None:
    root = recomp_root()
    probs = []
    if not (root / ".git").exists():
        probs.append(f"{root} is not a git repo")
    else:
        if "crabsmack/XMen2Recomp" not in git(root, "remote", "get-url", "origin"):
            probs.append("origin is not crabsmack/XMen2Recomp")
        elif gh_json("repos/crabsmack/XMen2Recomp", ".private") != "true":
            probs.append("crabsmack/XMen2Recomp is not private (or gh can't see it)")
        mods = (root / ".gitmodules").read_text(encoding="utf-8") if (root / ".gitmodules").exists() else ""
        for want in ("crabsmack/segagenesisrecomp", "crabsmack/xmen2disasm"):
            if want not in mods:
                probs.append(f".gitmodules lacks {want}")
        roms = [p for p in git(root, "log", "--all", "--name-only", "--format=").splitlines() if ROM_EXT.search(p)]
        if roms:
            probs.append(f"ROM-like files in history: {roms[:3]}")
        if gh_json("repos/crabsmack/segagenesisrecomp/actions/permissions", ".enabled") != "false":
            probs.append("Actions not disabled on crabsmack/segagenesisrecomp")
    crit("K1", not probs, "; ".join(probs) or f"{root} set up")

    runs = corpus_runs()
    lacking = []
    for run in runs:
        p = runs_dir() / run / "frames.csv"
        cols = read_frames(p)[0] if p.exists() else []
        if any(c not in cols for c in COMPARED + REPORTED):
            lacking.append(run)
    exporter = (ROOT / "emu" / "export_input.py").exists()
    crit("K2", not lacking and exporter,
         f"{len(runs) - len(lacking)}/{len(runs)} reference runs have {'/'.join(COMPARED + REPORTED)}"
         + ("" if exporter else "; emu/export_input.py missing"))

    gen, err = contract("gen")
    if gen is None:
        crit("K3", False, err)
    else:
        made = {str(a).upper().zfill(6) for a in gen.get("functions", [])}
        missing = [f["addr"] for f in functions() if f["addr"] not in made]
        ok = gen.get("unsupported") == 0 and gen.get("validator_errors") == 0 and not missing
        crit("K3", ok, f"unsupported {gen.get('unsupported')}, validator errors {gen.get('validator_errors')}, "
                       f"functions missing {len(missing)}" + (f" (first {missing[0]})" if missing else ""))
    b, err = contract("build")
    if b is None:
        crit("K4", False, err)
    else:
        exe = Path(b.get("exe", ""))
        gen_dir = root / "build" / "generated"
        newest = max((p.stat().st_mtime for p in gen_dir.rglob("*.c")), default=0) if gen_dir.exists() else 0
        ok = b.get("ok") is True and b.get("config") == "Release" and exe.is_file() and exe.stat().st_mtime >= newest
        crit("K4", ok, f"{exe} ({b.get('config')})" + ("" if ok else ": missing, not Release, or older than generated C"))

    tr = Traces(fresh)
    boot = tr.run("tas", "recomp", BOOT_FRAMES)
    crit("K5", boot["ok"], f"first {BOOT_FRAMES} frames: {boot['detail']}")
    trace_criteria("K6", "K8", "K7", "recomp", tr, crit)
    tas = tr.run("tas", "recomp")
    fps = (tas.get("stats") or {}).get("fps") or 0
    crit("K9", tas["ok"] and fps >= MIN_FPS, f"{fps:.0f} fps uncapped (need {MIN_FPS:.0f})")
    uv_doc = root / "docs" / "USER_VERIFIED.md"
    ok = uv_doc.exists() and re.search(rf"^user-verified: {DATE}", uv_doc.read_text(encoding="utf-8"), re.M)
    crit("K10", bool(ok), "user-verified line present" if ok else f"no `user-verified: DATE` in {uv_doc} (ask the user)")


# --- phase 3: compiler -------------------------------------------------------------------

def load_toml(p: Path) -> dict | None:
    try:
        return tomllib.loads(p.read_text(encoding="utf-8"))
    except (OSError, tomllib.TOMLDecodeError):
        return None


def phase3(crit, fresh: bool) -> None:
    cdir = ROOT / "config" / "compiler"
    cands = (load_toml(cdir / "candidates.toml") or {}).get("candidate", [])
    probs = []
    for fam in FAMILIES:
        if not any(c.get("family") == fam for c in cands):
            probs.append(f"no {fam} candidate")
    for c in cands:
        if not all(c.get(k) for k in ("id", "family", "version", "status", "source")):
            probs.append(f"{c.get('id', '?')}: missing fields")
        elif c["status"] not in ("obtained", "unavailable"):
            probs.append(f"{c['id']}: status {c['status']}")
    obtained = [c["id"] for c in cands if c.get("status") == "obtained"]
    crit("C1", bool(cands) and not probs,
         "; ".join(probs[:4]) or f"{len(cands)} candidates, {len(obtained)} obtained")

    if not (ROOT / "tools" / "cc_libmatch.py").exists():
        crit("C2", False, "tools/cc_libmatch.py missing")
    else:
        r = uv_run(ROOT, "tools/cc_libmatch.py", "--json", timeout=3600)
        res = (parse_json(r.stdout) or {}).get("results", {})
        gaps = [f"{c}/{fn}" for c in obtained for fn in LIB_ROUTINES
                if res.get(c, {}).get(fn) not in ("exact", "differs", "absent")]
        exact = sorted({c for c in obtained if any(v == "exact" for v in res.get(c, {}).values())})
        crit("C2", bool(obtained) and r.returncode == 0 and not gaps,
             f"{len(obtained) * len(LIB_ROUTINES) - len(gaps)}/{len(obtained) * len(LIB_ROUTINES)} compared; "
             f"exact matches in: {', '.join(exact) or 'none'}" + (f"; missing {gaps[0]}" if gaps else ""))

    cc = ROOT / "tools" / "cc.py"
    st = uv_run(ROOT, "tools/cc.py", "--selftest", timeout=1800) if cc.exists() else None
    crit("C3", bool(st) and st.returncode == 0,
         "selftest ok" if st and st.returncode == 0 else ("tools/cc.py missing" if not st else (st.stdout + st.stderr)[-200:]))

    v = load_toml(cdir / "verdict.toml") or {}
    funcs = {f["addr"]: f["name"] for f in functions()}
    if v.get("verdict") == "identified":
        files = sorted((cdir / "match").glob("*.c")) if (cdir / "match").exists() else []
        failed, sw, vcall, mods = [], 0, 0, set()
        for f in files:
            addr = f.stem.upper()
            if addr not in funcs:
                failed.append(f"{f.name}: not a function start")
                continue
            r = uv_run(ROOT, "tools/cc.py", "--match", str(f), timeout=1800)
            if r.returncode != 0:
                failed.append(f"{f.name}: no match")
                continue
            asm = (ROOT / "src" / "f" / f"{addr}.asm").read_text(encoding="utf-8")
            sw += "\tjmp\tSw_" in asm
            vcall += bool(re.search(r"movea\.l\t\$[0-9A-F]+\(a0\),a1\n\tjsr\t\(a1\)", asm))
            mods.add(funcs[addr].split("_")[0])
        n = len(files) - len(failed)
        ok = bool(v.get("candidate")) and "flags" in v and n >= 20 and not failed and sw >= 2 and vcall >= 2 and len(mods) >= 5
        crit("C4", ok, f"identified {v.get('candidate')}: {n} matching (need 20), switch {sw}/2, vcall {vcall}/2, "
                       f"modules {len(mods)}/5" + (f"; {failed[0]}" if failed else ""))
    elif v.get("verdict") == "not-identified":
        unexplained = [c["id"] for c in cands if c.get("status") == "obtained" and not c.get("mismatch")]
        ack = re.fullmatch(DATE, str(v.get("user_ack", "")))
        crit("C4", not unexplained and bool(ack),
             f"not identified; unexplained candidates {unexplained or 'none'}; user_ack {'ok' if ack else 'missing'}")
    else:
        crit("C4", False, "config/compiler/verdict.toml has no verdict")
    doc = (ROOT / "docs" / "COMPILER.md").read_text(encoding="utf-8") if (ROOT / "docs" / "COMPILER.md").exists() else ""
    pol = str(v.get("decomp_policy") or "")
    crit("C5", pol in POLICIES and bool(v.get("reason")) and pol in doc,
         f"decomp_policy {pol}" + ("" if pol in doc else " (not explained in docs/COMPILER.md)"))


# --- phase 4: decomp ---------------------------------------------------------------------

def kickoff(cid: str, phase: int, crit) -> bool:
    t = (ROOT / "docs" / "phases" / DOCS[phase]).read_text(encoding="utf-8")
    ok = bool(re.search(rf"^approved: {DATE}", t, re.M)) and "DRAFT" not in t
    crit(cid, ok, "criteria approved" if ok else f"docs/phases/{DOCS[phase]} is a draft: revise it, then ask the user")
    return ok


def reviews(root: Path, total: int, need: float) -> tuple[bool, str]:
    reviewed = agree = disputes = 0
    for r in (root / "docs" / "reviews").glob("*.md") if (root / "docs" / "reviews").exists() else []:
        t = r.read_text(encoding="utf-8")
        vals = {k: int(m.group(1)) for k in ("reviewed", "agree", "open disputes")
                if (m := re.search(rf"^{k}:\s*(\d+)", t, re.M | re.I))}
        reviewed += vals.get("reviewed", 0)
        agree += vals.get("agree", 0)
        disputes += vals.get("open disputes", 0)
    ok = reviewed >= need * total and reviewed > 0 and agree / reviewed >= 0.9 and disputes == 0
    return ok, f"reviewed {reviewed} (need {int(need * total)}), agree {agree}, open disputes {disputes}"


COUNTERS = ("dispatch_misses", "interp_instructions", "stub_hits")


def unreachable_insns() -> dict[str, set[str]]:
    """P4-decomp.md "Unreachable instructions" (decision 10): function address -> the addresses of
    its instructions no state can execute (rows `| Name `$FUNC` | `$INSN` ... | why |`)."""
    t = (ROOT / "docs" / "phases" / DOCS[4]).read_text(encoding="utf-8")
    sec = t.split("### Unreachable instructions", 1)
    out: dict[str, set[str]] = {}
    if len(sec) < 2:
        return out
    for line in sec[1].splitlines()[1:]:
        if line.startswith("#"):
            break
        cells = [c for c in line.split("|")]
        if len(cells) < 4 or not re.search(r"\$[0-9A-F]{6}", cells[1]):
            continue
        fn = re.search(r"\$([0-9A-F]{6})", cells[1]).group(1)
        out.setdefault(fn, set()).update(re.findall(r"\$([0-9A-F]{6})", cells[2]))   # a function may have several rows
    return out


def function_coverage(funcs: list[dict]) -> dict[str, str]:
    """full / partial / never per function, from the committed corpus coverage (emu/coverage)."""
    import bisect
    import numpy as np
    import coverage
    exe, _runs = coverage.union("exec", 0x400000 // 16)
    bits = np.unpackbits(exe, bitorder="little")
    starts = sorted((int(f["addr"], 16), int(f["end"], 16), f["addr"]) for f in funcs)
    keys = [s for s, _e, _a in starts]
    seen: dict[str, list[int]] = {}
    for line in (ROOT / "build" / "recomp" / "code_addrs.txt").read_text().split():
        if line.startswith("#"):
            continue
        a = int(line, 16)
        i = bisect.bisect_right(keys, a) - 1
        if i < 0 or a >= starts[i][1]:
            continue
        s = seen.setdefault(starts[i][2], [0, 0])
        s[0] += 1
        s[1] += int(bits[a >> 1])
    out = {}
    for f in funcs:
        n, hit = seen.get(f["addr"], [0, 0])
        out[f["addr"]] = "never" if hit == 0 else ("full" if hit == n else "partial")
    return out


def cached_contract(tr: "Traces", key: str, *args: str, timeout: int = 7200,
                    rev: str | None = None) -> tuple[dict | None, str]:
    """A contract call cached per game-repo revision, like traces (for the slow `verify`), or per
    `rev` (phase 5: the hashes of what the call reads)."""
    rev = rev or tr.rev
    hit = tr.cache.get(key)
    if rev and hit and hit.get("rev") == rev:
        return hit["data"], ""
    data, err = contract(*args, timeout=timeout)
    if data is not None and rev:
        tr.cache[key] = {"data": data, "rev": rev}
        tr.save()
    return data, err


def sync_traces(tr: "Traces", mode: str, refs: dict[str, Path]) -> list[str]:
    """Stepped/handc traces of every corpus run against the same frame-synchronous runner with
    all generated code (`stepped-gen`; P4-decomp.md decision 5) -> failures. REFDIR (the run's D1
    trace) gives each sync point's reference frame for the input."""
    def one(run: str) -> str | None:
        if run not in refs:
            return f"{run} (no D1 sync reference)"
        extra = ("--replay", str(refs[run].parent))
        g = tr.plain(run, "stepped-gen", extra, timed_key=True)
        gs = g.get("stats") or {}
        if not g["ok"] or any(gs.get(k) != 0 for k in COUNTERS):
            return (f"{run} (stepped-gen: {g['detail'][:120]}; "
                    + ", ".join(f"{k} {gs.get(k)}" for k in COUNTERS) + ")")
        r = tr.run(run, mode, None, extra, ref_sync=Path(g["csv"]))
        s = r.get("stats") or {}
        if not r["ok"] or any(s.get(k) != 0 for k in COUNTERS):
            return f"{run} ({r['detail'][:160]}; " + ", ".join(f"{k} {s.get(k)}" for k in COUNTERS) + ")"
        return None
    return [b for b in pmap(one, corpus_runs()) if b]


def d1_refs(tr: "Traces", runs: list[str], rev: str | None = None) -> tuple[list[str], dict[str, Path], int | None]:
    """D1 (P4-decomp.md): the timed runner still equals gpgx on every run and writes the sync
    reference + replay log -> (failures, run -> its sync.csv, the TAS's stack_low). rev: cache
    revision (phase 5: the timed runner's hash); default the timed key of phase 4."""
    refs: dict[str, Path] = {}
    bad, stack_low = [], None

    def d1(run: str):
        r = tr.run(run, "recomp", None, ("--sync",), timed_key=True, rev=rev)
        sync = Path(r["csv"]).parent / "sync.csv" if r.get("csv") else None
        if r["ok"] and not (sync and sync.exists() and (sync.parent / "replay.bin").exists()):
            r = tr.run(run, "recomp", None, ("--sync",), use_cache=False, timed_key=True, rev=rev)  # outputs gone
            sync = Path(r["csv"]).parent / "sync.csv" if r.get("csv") else None
        return r, sync
    for run, (r, sync) in zip(runs, pmap(d1, runs)):
        s = r.get("stats") or {}
        rows = len(read_frames(sync, "sync")[1]) if sync and sync.exists() else 0
        if run == "tas":
            stack_low = s.get("stack_low")
        if not r["ok"] or any(s.get(k) != 0 for k in COUNTERS):
            bad.append(f"{run} ({r['detail'][:200]})")
        elif not rows or not (sync.parent / "replay.bin").exists() or s.get("stack_low") is None:
            bad.append(f"{run} (no sync rows, replay.bin or stack_low)")
        else:
            refs[run] = sync
    return bad, refs, stack_low


def d4_ledger(tr: "Traces", funcs: list[dict], runs: list[str], whole_game_ok: bool,
              ledger: str = "phase4_functions.json", verify_key: str = "verify|all",
              verify_rev: str | None = None) -> tuple[bool, str, dict | None]:
    """D4 (P4-decomp.md "Every function done"), the per-function ledger -> (ok, detail, lint).
    whole_game_ok: the whole-game comparisons that verify EntryPoint and the vectors (decision 12;
    phase 4: D2 and D6, phase 5: P1). Writes build/<ledger>."""
    root = recomp_root()
    by_addr = {f["addr"]: f["name"] for f in funcs}
    cov = function_coverage(funcs)
    errs = []
    h, err = contract("handc")
    errs += [err] if h is None else []
    handc = {str(k).upper().zfill(6): v for k, v in (h or {}).get("functions", {}).items()}
    # decisions 7, 8: fragments are done with the C that contains them; never-executed asm may verify
    frags = {str(k).upper().zfill(6): v for k, v in (h or {}).get("fragments", {}).items()}
    asm = {str(a).upper().zfill(6) for a in (h or {}).get("asm", [])}
    # decision 12: EntryPoint and the interrupt vectors are verified by the whole-game comparisons
    whole_game = {str(a).upper().zfill(6) for a in (h or {}).get("whole_game", [])}
    # decision 10: instructions the phase doc lists as unreachable count as covered
    unreachable = unreachable_insns()
    lint, err = contract("lint")
    errs += [err] if lint is None else []
    lint_files = (lint or {}).get("files", {})
    vres: dict[str, dict] = {}
    matched: set[str] = set()
    if handc:
        inputs = tr.out_dir / "inputs"
        for run in runs:
            if not (inputs / f"{run}.input").exists():
                _p, e = export_input(run, inputs)
                errs += [e] if e else []
        verify, err = cached_contract(tr, verify_key, "verify", "--inputs", str(inputs), timeout=6 * 3600,
                                      rev=verify_rev)
        errs += [err] if verify is None else []
        vres = {str(k).upper().zfill(6): v for k, v in (verify or {}).get("functions", {}).items()}
        r = uv_run(ROOT, "tools/cc.py", "--match-recomp", str(root), "--json", timeout=6 * 3600)
        mj = parse_json(r.stdout)
        if mj is None:
            errs.append(f"cc.py --match-recomp failed ({r.returncode}): {(r.stdout + r.stderr)[-160:]}")
        matched = {str(a).upper().zfill(6) for a in (mj or {}).get("matched", [])}
    led, counts = {}, dict.fromkeys(("in_c", "doc", "lint", "matched", "verified", "done"), 0)
    never_matched = 0
    for f in sorted(funcs, key=lambda f: f["addr"] in frags):   # fragments after their parents
        a = f["addr"]
        if a in frags:
            fr = frags[a]
            p = led.get(str(fr.get("parent") or "").upper().zfill(6)) or {}
            done = bool(fr.get("named")) and bool(p.get("done"))
            led[a] = {"name": by_addr[a], "coverage": cov[a], "fragment_of": fr.get("parent"),
                      "named_in_parent": bool(fr.get("named")), "in_c": done, "doc": done, "lint_clean": done,
                      "matched": False, "verify": None, "done": done,
                      "missing": [] if done else ["parent done" if fr.get("named") else "named in its parent's C"],
                      "needs": "parent"}
            for k in ("in_c", "doc", "lint", "verified", "done"):
                counts[k] += done
            continue
        e = handc.get(a) or {}
        in_c = bool(e) and e.get("name") == by_addr[a]
        doc = in_c and bool(e.get("doc"))
        lv = lint_files.get(f"game/c/{a}.c")
        lint_ok = in_c and lv is not None and all(v == 0 for v in lv.values())
        v = vres.get(a) or {}
        uncovered = v.get("uncovered")
        if a in unreachable and uncovered:
            unc = set(v.get("uncovered_pcs") or [])
            ran = sorted(unreachable[a] - unc)
            if ran or not unc:
                errs.append(f"${a}: listed unreachable but executed (or too many uncovered): {ran[:4]}")
            else:
                uncovered -= len(unreachable[a])
        shadow = ((cov[a] != "never" or a in asm) and v.get("calls_checked", 0) >= 1 and v.get("mismatches") == 0
                  and uncovered == 0)
        verified = in_c and (a in matched or shadow or (a in whole_game and whole_game_ok))
        done = in_c and doc and lint_ok and verified
        missing = [k for k, ok in (("c", in_c), ("doc", doc), ("lint", lint_ok), ("verified", verified)) if not ok]
        led[a] = {"name": by_addr[a], "coverage": cov[a], "in_c": in_c, "doc": doc, "lint_clean": lint_ok,
                  "matched": a in matched, "verify": v or None, "done": done, "missing": missing,
                  "needs": "match" if cov[a] == "never" else "match or verify"}
        for k, ok in (("in_c", in_c), ("doc", doc), ("lint", lint_ok), ("matched", a in matched),
                      ("verified", verified), ("done", done)):
            counts[k] += ok
        never_matched += cov[a] == "never" and a in matched
    (ROOT / "build").mkdir(exist_ok=True)
    (ROOT / "build" / ledger).write_text(json.dumps(led, indent=0), encoding="utf-8")
    n_never = sum(c == "never" for c in cov.values())
    mism = sum(1 for v in vres.values() if v.get("mismatches"))
    ok = counts["done"] == len(funcs) and not errs
    detail = (f"{counts['done']}/{len(funcs)} done; in C {counts['in_c']}, documented {counts['doc']}, "
              f"lint-clean {counts['lint']}, verified {counts['verified']} (matched {counts['matched']}, "
              f"never-executed matched {never_matched}/{n_never}), functions with mismatches {mism}"
              + (f"; {errs[0][:160]}" if errs else ""))
    return ok, detail, lint


def phase4(crit, fresh: bool, draft: bool = False) -> None:
    if not kickoff("D0", 4, crit) and not draft:
        return
    root = recomp_root()
    funcs = functions()
    tr = Traces(fresh)
    runs = corpus_runs()

    # D1: the timed runner still equals gpgx, and writes the sync reference + replay log
    bad, refs, stack_low = d1_refs(tr, runs)
    crit("D1", not bad, f"{len(runs) - len(bad)}/{len(runs)} runs equal gpgx with sync.csv + replay.bin"
                        f" (tas stack_low {stack_low})" + (f"; first: {bad[0]}" if bad else ""))

    # D2: the frame-synchronous stepped runner with hand C equals it with all generated code
    bad = sync_traces(tr, "stepped", refs)
    d2_ok = not bad
    crit("D2", not bad, f"{len(runs) - len(bad)}/{len(runs)} corpus runs equal at every sync point"
                        + (f"; first: {bad[0]}" if bad else ""))
    # D6 (reported in its place below) is computed here: decision 12 makes D4 depend on it
    b6, err6 = contract("build", "--handc")
    gen6 = (b6 or {}).get("generated_game_functions")
    built6 = b6 is not None and b6.get("ok") is True and gen6 == 0
    bad6 = sync_traces(tr, "handc", refs) if built6 else []
    d6_ok = built6 and not bad6

    # D3: types declared
    sys.path.insert(0, str(ROOT / "tools"))
    import classes  # noqa: E402
    import m68k  # noqa: E402
    class_names = {n.upper() for n, _p in classes.find_classes(m68k.load_rom()).values()}
    with open(ROOT / "build" / "recomp" / "ram_globals.csv", newline="") as f:
        global_names = {r["name"] for r in csv.DictReader(f)}
    types, err = contract("types")
    if types is None:
        crit("D3", False, err)
    else:
        ms = sorted(class_names - {str(s).upper() for s in types.get("structs", [])})
        mg = sorted(global_names - set(types.get("globals", [])))
        crit("D3", not ms and not mg, f"class structs missing {len(ms)}/{len(class_names)}, "
                                      f"globals missing {len(mg)}/{len(global_names)}"
                                      + (f" (first {(ms + mg)[0]})" if ms or mg else ""))

    # D4: every function done (the ledger)
    ok4, detail4, lint = d4_ledger(tr, funcs, runs, d2_ok and d6_ok)
    crit("D4", ok4, detail4)

    # D5: readable
    if lint is None or types is None:
        crit("D5", False, "lint or types contract failed")
    else:
        viol = lint.get("violations", {})
        badr = {k: viol.get(k) for k in LINT_RULES if viol.get(k) != 0}
        fields, unk = types.get("fields", 0), types.get("unk_fields", 0)
        ok = not badr and fields > 0 and unk <= 0.05 * fields
        crit("D5", ok, ("lint clean" if not badr else f"violations {badr}") + f"; unk fields {unk}/{fields} (max 5%)")

    # D6: hand C only (computed after D2)
    crit("D6", d6_ok,
         err6 or (f"generated game functions linked {gen6}" + (f" (first {b6.get('first')})" if gen6 else "")
                  + (f"; {len(runs) - len(bad6)}/{len(runs)} corpus runs equal" if built6 else "; build not ok")
                  + (f"; first: {bad6[0]}" if bad6 else "")))

    ok, detail = reviews(root, len(funcs), 0.05)
    crit("D7", ok, detail)
    uv_doc = root / "docs" / "USER_VERIFIED.md"
    ok = uv_doc.exists() and re.search(rf"^handc-verified: {DATE}", uv_doc.read_text(encoding="utf-8"), re.M)
    crit("D8", bool(ok), "handc-verified line present" if ok else f"no `handc-verified: DATE` in {uv_doc} (ask the user)")


# --- phase 5: port -----------------------------------------------------------------------

# Hardware addresses in the game's own sources (P5-port.md P4): the Z80 area and I/O
# ($A0xxxx-$A1xxxx, TMSS $A14000 included), the VDP and PSG ($C000xx)
HW_ADDR = re.compile(r"\b0x0*(A[01][0-9A-F]{4}|C000[0-1][0-9A-F])(?![0-9A-F])", re.I)
GAME_SRC = ("game/c", "game/include")   # the game's code: the object scan's and P4's scope
P5_IDS = [f"P{i}" for i in range(9)]
BENCH_GATES = (("clean_build_s", 300.0, "clean build"), ("corpus_check_total_s", 900.0, "full corpus check"))
RELEASE_PLATFORMS = ("windows", "linux")   # P5-port.md R7 (default: both)


class Stages:
    """phase.py 5 talks as it goes: each stage as it finishes, to stderr and build/phase5.log
    (LESSONS.md: a silent 3-hour run hid a 1-minute failure)."""

    def __init__(self) -> None:
        self.t0 = time.monotonic()
        self.path = ROOT / "build" / "phase5.log"
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self.path.write_text(f"phase.py 5, {date.today().isoformat()}, game repo {recomp_root()}\n", encoding="utf-8")

    def __call__(self, msg: str) -> None:
        line = f"[{time.monotonic() - self.t0:7.1f}s] {msg}"
        print(line, file=sys.stderr, flush=True)
        with open(self.path, "a", encoding="utf-8") as f:
            f.write(line + "\n")


_SHA: dict[tuple[str, int, int], str] = {}


def file_sha(p: Path) -> str | None:
    """SHA-1 of a file, memoised by path, size and mtime (runner executables are tens of MB)."""
    try:
        st = p.stat()
    except OSError:
        return None
    k = (str(p), st.st_size, st.st_mtime_ns)
    if k not in _SHA:
        import hashlib
        h = hashlib.sha1()
        with open(p, "rb") as f:
            for chunk in iter(lambda: f.read(1 << 20), b""):
                h.update(chunk)
        _SHA[k] = h.hexdigest()
    return _SHA[k]


def runner_exe(name: str) -> Path:
    """A runner of the game repo's build tree ($XMEN2_BUILD, as its tools/common.py)."""
    b = Path(os.environ.get("XMEN2_BUILD") or recomp_root() / "build")
    return b / "Release" / f"{name}.exe" if sys.platform == "win32" else b / name


def content_rev(name: str, *reads: Path) -> str | None:
    """Phase 5's cache revision for a trace or verify: the hash of the runner executable that
    produced it and of the files it reads (the builds are deterministic), so a commit that changes
    no code reruns nothing (LESSONS.md item 4). None (no caching) when the runner is missing."""
    h = file_sha(runner_exe(name))
    if h is None:
        return None
    parts = [f"{name}:{h}"]
    for p in reads:
        files = sorted(q for q in p.rglob("*") if q.is_file()) if p.is_dir() else [p]
        parts += [f"{q.name}:{file_sha(q)}" for q in files]
    import hashlib
    return "exe:" + hashlib.sha1("|".join(parts).encode()).hexdigest()


def approved(phase: int) -> bool:
    t = (ROOT / "docs" / "phases" / DOCS[phase]).read_text(encoding="utf-8")
    return bool(re.search(rf"^approved: {DATE}", t, re.M)) and "DRAFT" not in t


def bench_gate(root: Path) -> tuple[bool, str]:
    """P0's harness gates, as XMen2Recomp tools/bench.py measured them (docs/bench.json)."""
    p = root / "docs" / "bench.json"
    if not p.exists():
        return False, "no docs/bench.json in the game repo (uv run tools/bench.py there)"
    try:
        d = json.loads(p.read_text(encoding="utf-8"))
    except ValueError as e:
        return False, f"docs/bench.json unreadable: {e}"
    cc = d.get("corpus_check_s") or {}
    vals = {"clean_build_s": d.get("clean_build_s"), "corpus_check_total_s": cc.get("total_s")}
    mode = d.get("corpus_check_mode") or cc.get("mode")
    probs = [f"{what} {vals[k]} s (need < {lim:.0f})" for k, lim, what in BENCH_GATES
             if not isinstance(vals[k], (int, float)) or vals[k] >= lim]
    if d.get("parallel_build_dirs_ok") is not True:
        probs.append("two build dirs at once not shown")
    if mode != "native":
        probs.append(f"corpus check measured with --mode {mode} (P1 traces --mode native)")
    detail = (f"bench {d.get('date')}: clean build {vals['clean_build_s']} s, corpus check "
              f"{vals['corpus_check_total_s']} s ({mode}), parallel build dirs {d.get('parallel_build_dirs_ok')}")
    return not probs, detail + (f"; {'; '.join(probs)}" if probs else "")


def hardware_addresses(root: Path) -> list[str]:
    """file:line of every hardware address in the game's sources, comments not counted."""
    hits = []
    for top in GAME_SRC:
        for p in sorted((root / top).rglob("*")) if (root / top).exists() else []:
            if p.suffix.lower() not in (".c", ".h", ".cpp", ".hpp"):
                continue
            t = p.read_text(encoding="utf-8", errors="replace")
            t = re.sub(r"/\*.*?\*/", lambda m: re.sub(r"[^\n]", " ", m.group(0)), t, flags=re.S)
            for i, line in enumerate(t.splitlines(), 1):
                if HW_ADDR.search(line.split("//", 1)[0]):
                    hits.append(f"{p.relative_to(root).as_posix()}:{i}")
    return hits


def first_object(objects: dict, cat: str) -> str:
    """The first game object (by path) still needing `cat`, with one of its symbols."""
    for path in sorted(objects):
        o = objects[path]
        if path.startswith(GAME_SRC) and o.get(cat):
            syms = (o.get("symbols") or {}).get(cat) or ["?"]
            return f" (first {path}: {syms[0]})"
    return ""


def phase5(crit, fresh: bool, draft: bool = False) -> None:
    """P5-port.md. Computed cheapest first, failing fast; reported in table order."""
    say = Stages()
    res: dict[str, tuple[bool, str]] = {}

    def put(cid: str, ok: bool, detail: str) -> None:
        res[cid] = (bool(ok), detail)
        say(f"{'PASS' if ok else 'FAIL'}  {cid} {' '.join(detail.split())[:240]}")

    def report() -> None:
        for cid in P5_IDS:
            ok, detail = res.get(cid, (False, "not measured: an earlier stage failed (see build/phase5.log)"))
            crit(cid, ok, detail)

    root = recomp_root()
    ok_a = approved(5)
    ok_b, bench = bench_gate(root)
    put("P0", ok_a and ok_b, ("criteria approved" if ok_a else
                              f"docs/phases/{DOCS[5]} is a draft: revise it, then ask the user") + f"; {bench}")
    if not ok_a and not draft:
        crit("P0", *res["P0"])
        return

    # the object scan: P3, P4, P6 and half of P5, in minutes
    say("build --native (all runners, then the object scan)")
    b, err = contract("build", "--native", timeout=4 * 3600)
    if b is None or b.get("ok") is not True:
        why = err or f"build not ok (log {b.get('log')})"
        for cid in P5_IDS[1:8]:
            put(cid, False, f"native build failed: {why}")
        report()
        return
    objs, tot = b.get("objects") or {}, b.get("totals") or {}
    nfiles = tot.get("files") or {}

    def scan(cat: str) -> tuple[bool, str]:
        n = tot.get(cat)
        return n == 0, f"{cat} symbols in game objects: {n} ({nfiles.get(cat, '?')} files){first_object(objs, cat)}"
    put("P3", *scan("cpu68"))
    hw = hardware_addresses(root)
    ok_bus, d_bus = scan("bus")
    put("P4", ok_bus and not hw, f"{d_bus}; hardware addresses in {'/'.join(GAME_SRC)}: {len(hw)}"
                                 + (f" (first {hw[0]})" if hw else ""))
    ok_ram, d_ram = scan("emu_ram")
    link = b.get("link") or {}
    forbidden = link.get("forbidden")
    cats = link.get("categories") or {}
    put("P6", forbidden == [], f"68000 machine symbols the native executable defines: "
                               f"{len(forbidden) if forbidden is not None else '?'}"
                               + (f" {json.dumps(cats)}" if cats else "")
                               + (f" (first {forbidden[0].get('symbol')} in {forbidden[0].get('object')})"
                                  if forbidden else ""))

    # P1: the corpus through the exporter, after a cut TAS run (a broken target fails in a minute)
    tr = Traces(fresh)
    runs = corpus_runs()
    say(f"D1 references: {len(runs)} timed runs (cached by the timed runner's hash)")
    bad1, refs, _low = d1_refs(tr, runs, rev=content_rev("XMen2Recomp"))
    if bad1:
        say(f"D1: {len(bad1)} runs without a valid reference, first {bad1[0][:200]}")

    def pair(run: str, frames: int | None = None, extra: tuple[str, ...] = ()) -> tuple[dict, dict]:
        """stepped-gen (the reference rows) and native for one run."""
        rx = ("--replay", str(refs[run].parent), *extra)
        sync = refs[run]
        g = tr.plain(run, "stepped-gen", rx, rev=content_rev("XMen2SteppedGen", sync))
        if not g["ok"]:
            return g, {"ok": False, "detail": f"stepped-gen: {g['detail']}"}
        if extra:   # P7: both sides' rows, compared by the caller
            return g, tr.plain(run, "native", rx, rev=content_rev("XMen2Native", sync))
        n = tr.run(run, "native", frames, rx, ref_sync=Path(g["csv"]), rev=content_rev("XMen2Native", sync))
        return g, n

    def counters_bad(s: dict) -> str:
        return ", ".join(f"{k} {s.get(k)}" for k in COUNTERS if s.get(k) != 0)

    p1_ok, copied = False, {}
    if "tas" not in refs:
        put("P1", False, f"no D1 reference for the TAS: {bad1[0][:200] if bad1 else '?'}")
    else:
        say("P1 smoke: native TAS, first 600 sync points")
        _g, smoke = pair("tas", 600)
        if not smoke["ok"] or counters_bad(smoke.get("stats") or {}):
            put("P1", False, f"smoke (TAS, 600 sync points): {smoke['detail'][:200]} "
                             f"{counters_bad(smoke.get('stats') or {})}")
        else:
            say(f"P1: native vs stepped-gen, {len(runs)} runs ({JOBS} at a time, longest first)")

            def one(run: str) -> tuple[str | None, dict]:
                if run not in refs:
                    return f"{run} (no D1 reference)", {}
                g, n = pair(run)
                s = n.get("stats") or {}
                gs = g.get("stats") or {}
                if not n["ok"] or counters_bad(s) or counters_bad(gs):
                    return f"{run} ({n['detail'][:160]}; {counters_bad(s) or counters_bad(gs)})", s
                return None, s
            out = pmap(one, runs)
            bad = [m for m, _s in out if m]
            copied = {run: (s.get("exported") or {}).get("copied_bytes") for run, (_m, s) in zip(runs, out)}
            p1_ok = not bad
            put("P1", p1_ok, f"{len(runs) - len(bad)}/{len(runs)} corpus runs equal at every sync point"
                             + (f"; first: {bad[0]}" if bad else ""))
    left = {r: c for r, c in copied.items() if c != 0}
    put("P5", ok_ram and bool(copied) and not left,
        f"{d_ram}; exporter copied bytes from emulated RAM on {len(left) if copied else '?'} runs"
        + (f" (tas {copied.get('tas')})" if copied else " (P1 not run)"))

    # P7: the frame rendered at every TAS sync point, platform renderer vs the engine's VDP
    if "tas" in refs:
        say("P7: framebuffers at every TAS sync point (--fb)")
        g, n = pair("tas", extra=("--fb",))
        if not (g["ok"] and n["ok"]):
            put("P7", False, f"traces: stepped-gen {g['detail'][:80]} / native {n['detail'][:80]}")
        else:
            fg, fn = read_frames(Path(g["csv"]), "sync")[1], read_frames(Path(n["csv"]), "sync")[1]
            first = next((s for s in sorted(fg) if not fg[s].get("fb_crc32")
                          or fg[s]["fb_crc32"] != (fn.get(s) or {}).get("fb_crc32")), None)
            put("P7", first is None and bool(fg) and len(fn) == len(fg),
                f"{len(fg)} sync points with equal framebuffers" if first is None and len(fn) == len(fg) else
                f"framebuffers differ from sync point {first} ({len(fg)} / {len(fn)} rows)")
    else:
        put("P7", False, "no D1 reference for the TAS")

    # P8: a ROM-free package per R7 platform and the user's word
    say("P8: package")
    pk, err = contract("package", timeout=3600)
    uv_doc = root / "docs" / "USER_VERIFIED.md"
    word = uv_doc.exists() and re.search(rf"^port-verified: {DATE}", uv_doc.read_text(encoding="utf-8"), re.M)
    got = {p.get("platform"): p for p in (pk or {}).get("packages") or []}
    probs = [f"{plat}: " + ("no package" if plat not in got else
                            f"ok {got[plat].get('ok')}, ROM windows {got[plat].get('rom_windows')}")
             for plat in RELEASE_PLATFORMS
             if plat not in got or not (got[plat].get("ok") is True and got[plat].get("rom_windows") == 0
                                        and Path(got[plat].get("zip", "")).is_file())]
    put("P8", pk is not None and not probs and bool(word),
        (err or ("; ".join(probs) if probs else f"packages {', '.join(RELEASE_PLATFORMS)} ROM-free"))
        + ("; port-verified line present" if word else f"; no `port-verified: DATE` in {uv_doc} (ask the user)"))

    # P2, the slowest: phase 4's ledger on these sources (verify cached by its runner and inputs)
    say("P2: the D4 ledger (verify, cc.py --match-recomp)")
    inputs = tr.out_dir / "inputs"
    for run in runs:   # before hashing them for verify's cache revision
        if not (inputs / f"{run}.input").exists():
            export_input(run, inputs)
    game = root / "game"
    ok2, d2, _lint = d4_ledger(tr, functions(), runs, p1_ok, ledger="phase5_functions.json",
                               verify_key="verify|all|p5",
                               verify_rev=content_rev("XMen2Verify", inputs, game / "verify",
                                                      game / "xmen2.code_addrs.txt", game / "xmen2.functions.csv"))
    put("P2", ok2, d2)
    report()


# --- driver ------------------------------------------------------------------------------

def status() -> int:
    p1 = ROOT / "docs" / "PROGRESS.md"
    lines = []
    for n in range(1, 6):
        p = p1 if n == 1 else ROOT / "docs" / "progress" / f"P{n}.md"
        m = re.search(r"\*\*(\d+)/(\d+) pass\.\*\*", p.read_text(encoding="utf-8")) if p.exists() else None
        when = re.search(r"\((\d{4}-\d{2}-\d{2})\)", p.read_text(encoding="utf-8")) if p.exists() else None
        s = f"{m.group(1)}/{m.group(2)} pass" if m else "not measured yet"
        lines.append(f"phase {n} ({PHASE_NAMES[n]}): {s}" + (f" as of {when.group(1)}" if when else ""))
    print("\n".join(lines))
    return 0


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("phase", help="1-5 or 'status'")
    ap.add_argument("--fresh", action="store_true", help="ignore cached trace results")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--draft", action="store_true",
                    help="phases 4, 5: measure every criterion even before D0/P0 is approved (it still fails)")
    args = ap.parse_args()
    if args.phase == "status":
        return status()
    phase = int(args.phase)
    if phase == 1:
        return subprocess.run([sys.executable, str(ROOT / "tools" / "progress.py"),
                               *(["--json"] if args.json else [])], cwd=ROOT).returncode
    if phase not in DOCS:
        ap.error("phase must be 1-5 or status")
    res: list[Result] = []

    def crit(cid: str, ok: bool, detail: str) -> None:
        res.append((cid, bool(ok), detail))

    b = subprocess.run([sys.executable, str(ROOT / "tools" / "build.py"), "--quiet"], cwd=ROOT,
                       capture_output=True, text=True)
    if b.returncode != 0:
        print("FAIL  disassembly does not build byte-identical (phase 1 rule); fix that first")
        return 1
    if not (ROOT / "build" / "recomp" / "functions.csv").exists():
        subprocess.run([sys.executable, str(ROOT / "tools" / "handoff.py")], cwd=ROOT, capture_output=True)
    if phase in (4, 5):
        (phase4 if phase == 4 else phase5)(crit, args.fresh, args.draft)
    else:
        {2: phase2, 3: phase3}[phase](crit, args.fresh)

    passed = sum(ok for _c, ok, _d in res)
    if args.json:
        print(json.dumps([{"id": c, "pass": ok, "detail": d} for c, ok, d in res], indent=1))
    else:
        for c, ok, d in res:
            print(f"{'PASS' if ok else 'FAIL'}  {c:3} {d}")
        print(f"\n{passed}/{len(res)} criteria pass" + (" -- PHASE COMPLETE" if passed == len(res) else ""))
    draft = " --draft" if args.draft and phase in (4, 5) else ""
    md = [f"# Phase {phase} ({PHASE_NAMES[phase]}) progress ({date.today().isoformat()})", "",
          f"Generated by `uv run tools/phase.py {phase}{draft}`; criteria in [{DOCS[phase]}](../phases/{DOCS[phase]})."
          + (" Measured past an unapproved kickoff." if draft else ""), "",
          "| | ID | Status |", "|---|---|---|"]
    md += [f"| {'✅' if ok else '❌'} | {c} | {' '.join(d.split()).replace('|', '/')} |" for c, ok, d in res]
    md += ["", f"**{passed}/{len(res)} pass.**"]
    out = ROOT / "docs" / "progress" / f"P{phase}.md"
    out.parent.mkdir(exist_ok=True)
    out.write_text("\n".join(md) + "\n", encoding="utf-8", newline="\n")
    return 0 if passed == len(res) and res else 1


if __name__ == "__main__":
    raise SystemExit(main())
