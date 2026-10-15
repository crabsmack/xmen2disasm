"""Measure every definition-of-done criterion (docs/DONE.md); write docs/PROGRESS.md.

    uv run tools/progress.py          # full check (rebuilds, re-runs coverage analysis)
    uv run tools/progress.py --json   # machine-readable

Exit 0 only when every criterion passes. The first failing criterion is the
autonomous loop's next job (see CLAUDE.md "Autonomous mode").
"""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from datetime import date

import build

ROOT = build.ROOT
REQUIRED_SCENARIOS = ["options-menu", "continue", "game-over", "two-player", "char-cyclops",
                      "char-wolverine", "char-gambit", "char-psylocke", "char-nightcrawler",
                      "char-beast", "char-magneto"]
AUTO = re.compile(r"^(sub|loc)_[0-9A-F]{6}$")


def run(*cmd: str) -> subprocess.CompletedProcess:
    return subprocess.run([sys.executable, *cmd], cwd=ROOT, capture_output=True, text=True)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--json", action="store_true")
    args = ap.parse_args()
    res: list[tuple[str, bool, str]] = []

    def crit(cid: str, ok: bool, detail: str) -> None:
        res.append((cid, ok, detail))

    b = run("tools/build.py", "--quiet")
    crit("S1", b.returncode == 0, b.stdout.strip().splitlines()[-1] if b.stdout.strip() else b.stderr[-200:])

    # --- runtime -------------------------------------------------------------
    sys.path.insert(0, str(ROOT / "emu"))
    import corpus  # noqa: E402
    want = [n for n, _ in corpus.corpus()]
    have = {p.stem for p in (ROOT / "emu" / "coverage").glob("*.json")}
    missing_runs = [n for n in want if n not in have]
    crit("R1", not missing_runs, f"{len(want) - len(missing_runs)}/{len(want)} corpus runs present")
    cov = run("tools/coverage.py")
    rep = json.loads((ROOT / "build" / "coverage_report.json").read_text()) if cov.returncode == 0 else None
    if rep:
        missed = sum((int(m["end"], 16) - int(m["start"], 16)) // 2 for m in rep["missed_code"])
        crit("R2", not rep["missed_code"], f"missed_code spans: {len(rep['missed_code'])} (~{missed} words)")
        crit("R3", not rep["mid_insn"], f"mid_insn: {len(rep['mid_insn'])}")
        notes = (ROOT / "docs" / "NOTES.md").read_text() if (ROOT / "docs" / "NOTES.md").exists() else ""
        unexplained = [c["start"] for c in rep["code_as_data"] if f"${c['start']}" not in notes]
        crit("R5", not unexplained, f"code_as_data unexplained: {len(unexplained)}/{len(rep['code_as_data'])}")
        crit("S4", rep["unlabelled_read_bytes"] == 0,
             f"runtime-read bytes outside labelled data: {rep['unlabelled_read_bytes']} "
             f"in {len(rep['raw_data_read_spans']) + len(rep['raw_dma_spans'])} spans")
        frac = rep["unlabelled_unread_bytes"] / rep["rom_size"]
        unlisted = [s["start"] for s in rep["unlabelled_unread_spans"] if f"${s['start']}" not in notes]
        crit("S5", frac <= 0.02 and not unlisted,
             f"unlabelled never-read bytes {100 * frac:.1f}% of ROM; {len(unlisted)} spans not listed in NOTES.md")
    else:
        for cid in ("R2", "R3", "R5", "S4", "S5"):
            crit(cid, False, "coverage analysis failed: " + (cov.stdout + cov.stderr)[-200:])
    scen = {p.stem for p in (ROOT / "emu" / "corpus" / "scenarios").glob("*.txt")}
    lacking = [s for s in REQUIRED_SCENARIOS if s not in scen]
    crit("R4", not lacking, f"missing scenarios: {', '.join(lacking) or 'none'}")

    # --- static ----------------------------------------------------------------
    jt = (ROOT / "src" / "jumptable.asm").read_text()
    crit("S2", "\tjtentry\t$" not in jt, f"numeric jump-table entries: {jt.count(chr(9) + 'jtentry' + chr(9) + '$')}")
    files = sorted((ROOT / "src" / "f").glob("*.asm"))
    texts = {f: f.read_text() for f in files}
    numeric = 0
    for t in texts.values():
        body = "\n".join(line.split(";")[0] for line in t.splitlines())
        for m in re.finditer(r"\$([0-9A-F]+)\(pc|\(\$([0-9A-F]+)\)\.l", body):
            v = int(m.group(1) or m.group(2), 16)
            numeric += v < 0x200000
    crit("S3", numeric == 0, f"numeric ROM operands in code: {numeric}")

    # --- understanding ---------------------------------------------------------
    names, headers_ok = [], 0
    glob_users: dict[str, set[str]] = {}
    for f, t in texts.items():
        lines = t.splitlines()
        first = next((ln[:-1] for ln in lines if re.match(r"^[A-Za-z_]\w*:$", ln)), f"sub_{f.stem}")
        names.append(first)
        header = [ln for ln in lines[:12] if ln.startswith(";")]
        headers_ok += any(re.match(rf"^; {re.escape(first)} - \S", ln) for ln in header)
        for g in set(re.findall(r"(-\$[0-9A-F]+)\(a5[,)]", "\n".join(ln.split(";")[0] for ln in lines))):
            glob_users.setdefault(g, set()).add(f.stem)
    auto = sum(1 for n in names if AUTO.match(n))
    unk = sum(1 for n in names if n.startswith("unk_"))
    crit("N1", auto == 0 and unk <= 0.05 * len(names),
         f"auto-named {auto}/{len(names)} ({100 * (len(names) - auto) / max(1, len(names)):.1f}% named), unk_ {unk}")
    crit("N2", headers_ok == len(names), f"documented headers {headers_ok}/{len(names)}")
    shared = [g for g, users in glob_users.items() if len(users) >= 2]
    crit("N3", not shared, f"numeric A5 globals used by 2+ functions: {len(shared)}")
    reviewed = agree = disputes = 0
    for r in (ROOT / "docs" / "reviews").glob("*.md") if (ROOT / "docs" / "reviews").exists() else []:
        t = r.read_text()
        for key, var in (("reviewed", "r"), ("agree", "a"), ("open disputes", "d")):
            m = re.search(rf"^{key}:\s*(\d+)", t, re.M | re.I)
            if m:
                if var == "r":
                    reviewed += int(m.group(1))
                elif var == "a":
                    agree += int(m.group(1))
                else:
                    disputes += int(m.group(1))
    ok = reviewed >= 0.1 * len(names) and reviewed and agree / reviewed >= 0.9 and disputes == 0
    crit("N4", bool(ok), f"reviewed {reviewed} (need {int(0.1 * len(names))}), agree {agree}, open disputes {disputes}")

    # --- handoff -----------------------------------------------------------------
    h = run("tools/handoff.py")
    crit("H1", h.returncode == 0, (h.stdout.strip().splitlines() or [h.stderr[-200:]])[-1])
    h2 = (ROOT / "emu" / "runs" / "tas" / "frames.csv").exists() and (ROOT / "docs" / "RECOMP_HANDOFF.md").exists()
    crit("H2", h2, "tas reference trace + docs/RECOMP_HANDOFF.md" + ("" if h2 else " missing"))

    order = ["S1", "R1", "R2", "R3", "R4", "R5", "S2", "S3", "S4", "S5", "N1", "N2", "N3", "N4", "H1", "H2"]
    res.sort(key=lambda r: order.index(r[0]))
    passed = sum(ok for _c, ok, _d in res)
    if args.json:
        print(json.dumps([{"id": c, "pass": ok, "detail": d} for c, ok, d in res], indent=1))
    else:
        for c, ok, d in res:
            print(f"{'PASS' if ok else 'FAIL'}  {c:3} {d}")
        print(f"\n{passed}/{len(res)} criteria pass" + ("" if passed < len(res) else " -- PHASE COMPLETE"))
    md = [f"# Progress ({date.today().isoformat()})", "",
          "Generated by `uv run tools/progress.py`; criteria in [DONE.md](DONE.md).", "",
          "| | ID | Status |", "|---|---|---|"]
    md += [f"| {'✅' if ok else '❌'} | {c} | {d} |" for c, ok, d in res]
    md += ["", f"**{passed}/{len(res)} pass.**"]
    (ROOT / "docs" / "PROGRESS.md").write_text("\n".join(md) + "\n", encoding="utf-8", newline="\n")
    return 0 if passed == len(res) else 1


if __name__ == "__main__":
    raise SystemExit(main())
