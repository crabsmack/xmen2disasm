"""Measure a phase's definition of done (docs/ROADMAP.md); write docs/progress/PN.md.

    uv run tools/phase.py 2            # phase 2 (recomp); also 3, 4, 5
    uv run tools/phase.py 2 --fresh    # ignore cached trace results
    uv run tools/phase.py 2 --json
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
import tomllib
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
    try:
        return subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, timeout=timeout)
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
        return None, f"xmen2check.py {' '.join(args)} failed ({r.returncode}): {(r.stdout + r.stderr)[-200:]}"
    return data, ""


def gh_json(path: str, jq: str) -> str:
    r = subprocess.run(["gh", "api", path, "--jq", jq], capture_output=True, text=True)
    return r.stdout.strip() if r.returncode == 0 else ""


# --- trace comparison --------------------------------------------------------------------

def read_frames(path: Path) -> tuple[list[str], dict[int, dict[str, str]]]:
    with open(path, newline="") as f:
        rd = csv.DictReader(f)
        rows = {int(r["frame"]): r for r in rd}
        return list(rd.fieldnames or []), rows


class Traces:
    """Runs contract traces for (run, mode, frames), compares with the reference, caches."""

    def __init__(self, fresh: bool):
        self.cache_path = ROOT / "build" / "phase_cache.json"
        self.cache = {} if fresh or not self.cache_path.exists() else json.loads(self.cache_path.read_text(encoding="utf-8"))
        root = recomp_root()
        head, engine = git(root, "rev-parse", "HEAD"), git(root / "segagenesisrecomp", "rev-parse", "HEAD")
        dirty = bool(git(root, "status", "--porcelain"))
        self.rev = None if dirty or not head else f"{head}:{engine}"
        self.out_dir = ROOT / "build" / "phase_traces"

    def save(self) -> None:
        self.cache_path.parent.mkdir(parents=True, exist_ok=True)
        self.cache_path.write_text(json.dumps(self.cache, indent=1), encoding="utf-8")

    def run(self, run: str, mode: str, frames: int | None = None, extra: tuple[str, ...] = (),
            use_cache: bool = True) -> dict:
        ref_csv = runs_dir() / run / "frames.csv"
        if not ref_csv.exists():
            return {"ok": False, "detail": f"no reference {ref_csv} (run emu/corpus.py)"}
        key = f"{run}|{mode}|{frames}|{' '.join(extra)}|{ref_csv.stat().st_mtime_ns}"
        hit = self.cache.get(key)
        if use_cache and hit and self.rev and hit.get("rev") == self.rev:
            return hit
        res = self._run(run, mode, frames, extra, ref_csv)
        if self.rev:
            self.cache[key] = {**res, "rev": self.rev}
            self.save()
        return res

    def _run(self, run, mode, frames, extra, ref_csv) -> dict:
        cols, ref = read_frames(ref_csv)
        lacking = [c for c in COMPARED + REPORTED if c not in cols]
        if lacking:
            return {"ok": False, "detail": f"reference {run} lacks {', '.join(lacking)} (K2)"}
        if not (recomp_root() / "tools" / "xmen2check.py").exists():
            return {"ok": False, "detail": "game repo has no tools/xmen2check.py (contract: P2-recomp.md)"}
        self.out_dir.mkdir(parents=True, exist_ok=True)
        inp = self.out_dir / f"{run}.input"
        e = uv_run(ROOT, "emu/export_input.py", run, "--out", str(inp), timeout=600)
        if e.returncode != 0 or not inp.exists():
            return {"ok": False, "detail": f"export_input.py {run} failed: {(e.stdout + e.stderr)[-200:]}"}
        out = self.out_dir / "-".join([run, mode, *(x.strip("-") for x in extra)])
        if out.exists():
            shutil.rmtree(out)
        args = ["trace", "--run", run, "--input", str(inp), "--out", str(out), "--mode", mode, *extra]
        if frames:
            args += ["--frames", str(frames)]
        stats, err = contract(*args)
        if stats is None:
            return {"ok": False, "detail": err}
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
    for run in corpus_runs():
        r = tr.run(run, mode, None, extra)
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


# --- phases 4 and 5 (drafts) -------------------------------------------------------------

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


def phase4(crit, fresh: bool) -> None:
    if not kickoff("D0", 4, crit):
        return
    funcs = functions()
    sys.path.insert(0, str(ROOT / "tools"))
    import classes  # noqa: E402
    import m68k  # noqa: E402
    names = {n.upper() for n, _p in classes.find_classes(m68k.load_rom()).values()}
    t, err = contract("types")
    if t is None:
        crit("D1", False, err)
    else:
        missing = sorted(names - {str(s).upper() for s in t.get("structs", [])})
        fields, unk = t.get("fields", 0), t.get("unk_fields", 0)
        ok = not missing and fields > 0 and unk <= 0.05 * fields
        crit("D1", ok, f"class structs missing {len(missing)}/{len(names)}, unk fields {unk}/{fields}"
                       + (f" (first {missing[0]})" if missing else ""))
    h, err = contract("handc")
    if h is None:
        crit("D2", False, err)
    else:
        got = {str(k).upper().zfill(6): v for k, v in h.get("functions", {}).items()}
        missing = [f["addr"] for f in funcs if f["addr"] not in got]
        by_addr = {f["addr"]: f["name"] for f in funcs}
        undoc = [a for a, v in got.items() if not v.get("doc") or v.get("name") != by_addr.get(a)]
        crit("D2", not missing and not undoc,
             f"{len(funcs) - len(missing)}/{len(funcs)} in C, {len(undoc)} without doc comment or disassembly name")
    d, err = contract("difftest", "--all", timeout=6 * 3600)
    if d is None:
        crit("D3", False, err)
    else:
        res = {str(k).upper().zfill(6): v for k, v in d.get("functions", {}).items()}
        bad = [f["addr"] for f in funcs if not (r := res.get(f["addr"])) or not r.get("pass")
               or r.get("cases", 0) < 1000 or r.get("branches_missed", 1) != 0]
        pol = (load_toml(ROOT / "config" / "compiler" / "verdict.toml") or {}).get("decomp_policy")
        unmatched = []
        if pol in ("matching-for-unexecuted", "matching-all"):
            executed = set()
            for p in runs_dir().glob("*/func_frames.json"):
                executed |= set(json.loads(p.read_text(encoding="utf-8")))
            want = [f["addr"] for f in funcs if pol == "matching-all" or f["addr"] not in executed]
            r = uv_run(ROOT, "tools/cc.py", "--match-recomp", str(recomp_root()), "--json", timeout=6 * 3600)
            matched = {str(a).upper().zfill(6) for a in (parse_json(r.stdout) or {}).get("matched", [])}
            unmatched = [a for a in want if a not in matched]
        crit("D3", not bad and not unmatched,
             f"difftest failing/insufficient {len(bad)}/{len(funcs)}; policy {pol}: unmatched {len(unmatched)}")
    trace_criteria("D4", "D4", None, "handc", Traces(fresh), _merge(crit))
    lint, err = contract("lint")
    if lint is None:
        crit("D5", False, err)
    else:
        v = lint.get("violations", {})
        bad = {k: v.get(k) for k in LINT_RULES if v.get(k) != 0}
        crit("D5", not bad, "lint clean" if not bad else f"violations {bad}")
    ok, detail = reviews(recomp_root(), len(funcs), 0.05)
    crit("D6", ok, detail)


def _merge(crit):
    """Collapse several results reported under one id into one (all must pass)."""
    seen: dict[str, list[tuple[bool, str]]] = {}

    def inner(cid: str, ok: bool, detail: str) -> None:
        seen.setdefault(cid, []).append((ok, detail))
        if len(seen[cid]) == 2:
            parts = seen[cid]
            crit(cid, all(o for o, _ in parts), "; ".join(d for _, d in parts))
    return inner


HW_ADDR = re.compile(r"0x0*(C000[0-1][0-9A-F]|A1[0-9A-F]{4}|A14000)\b", re.I)


def phase5(crit, fresh: bool) -> None:
    if not kickoff("P0", 5, crit):
        return
    root = recomp_root()
    lint, err = contract("lint", "--native")
    n = (lint or {}).get("violations", {}).get("emulated_ram")
    crit("P1", lint is not None and n == 0, err or f"emulated-RAM accesses in game/: {n}")
    tr = Traces(fresh)
    trace_criteria("P2", "P2", None, "native", tr, _merge(crit))
    b, err = contract("build", "--native")
    forbidden = (b or {}).get("forbidden_symbols", ["?"])
    crit("P3", b is not None and b.get("ok") is True and not forbidden,
         err or f"forbidden symbols in native link: {len(forbidden)}" + (f" (first {forbidden[0]})" if forbidden else ""))
    hits = []
    for p in (root / "game").rglob("*") if (root / "game").exists() else []:
        if p.suffix.lower() in (".c", ".h", ".cpp", ".hpp"):
            for i, line in enumerate(p.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
                if HW_ADDR.search(line):
                    hits.append(f"{p.relative_to(root)}:{i}")
    crit("P4", (root / "game").exists() and not hits,
         f"hardware addresses in game/: {len(hits)}" + (f" (first {hits[0]})" if hits else ""))
    # renderer: same run through the engine's VDP and the platform renderer; `--fb` adds an
    # fb_crc32 column. Not cached: the comparison needs both CSVs on disk.
    a = tr.run("tas", "native", None, ("--renderer", "vdp", "--fb"), use_cache=False)
    c = tr.run("tas", "native", None, ("--renderer", "native", "--fb"), use_cache=False)
    if not (a["ok"] and c["ok"]):
        crit("P5", False, f"traces: vdp {a['detail'][:60]} / native {c['detail'][:60]}")
    else:
        fa, fc = read_frames(Path(a["csv"]))[1], read_frames(Path(c["csv"]))[1]
        first = next((f for f in sorted(fa) if "fb_crc32" not in fa[f]
                      or fa[f]["fb_crc32"] != fc.get(f, {}).get("fb_crc32")), None)
        crit("P5", first is None and bool(fa),
             f"{len(fa)} frames equal" if first is None else f"framebuffers differ from frame {first}")
    uv_doc = root / "docs" / "USER_VERIFIED.md"
    ok = uv_doc.exists() and re.search(rf"^port-verified: {DATE}", uv_doc.read_text(encoding="utf-8"), re.M)
    crit("P6", bool(ok), "port-verified line present" if ok else f"no `port-verified: DATE` in {uv_doc} (ask the user)")


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
    {2: phase2, 3: phase3, 4: phase4, 5: phase5}[phase](crit, args.fresh)

    passed = sum(ok for _c, ok, _d in res)
    if args.json:
        print(json.dumps([{"id": c, "pass": ok, "detail": d} for c, ok, d in res], indent=1))
    else:
        for c, ok, d in res:
            print(f"{'PASS' if ok else 'FAIL'}  {c:3} {d}")
        print(f"\n{passed}/{len(res)} criteria pass" + (" -- PHASE COMPLETE" if passed == len(res) else ""))
    md = [f"# Phase {phase} ({PHASE_NAMES[phase]}) progress ({date.today().isoformat()})", "",
          f"Generated by `uv run tools/phase.py {phase}`; criteria in [{DOCS[phase]}](../phases/{DOCS[phase]}).", "",
          "| | ID | Status |", "|---|---|---|"]
    md += [f"| {'✅' if ok else '❌'} | {c} | {d} |" for c, ok, d in res]
    md += ["", f"**{passed}/{len(res)} pass.**"]
    out = ROOT / "docs" / "progress" / f"P{phase}.md"
    out.parent.mkdir(exist_ok=True)
    out.write_text("\n".join(md) + "\n", encoding="utf-8", newline="\n")
    return 0 if passed == len(res) and res else 1


if __name__ == "__main__":
    raise SystemExit(main())
