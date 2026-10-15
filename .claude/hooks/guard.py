"""PreToolUse guard for xmen2disasm. Exit 2 blocks the call; stderr goes to Claude.

Enforces CLAUDE.md's rules mechanically:
  - no edits to the ROM, build outputs, vendored assembler, or the expected hash
  - no direct assembler calls (tools/build.py is the only build path)
  - no re-split over hand-edited sources
  - no committing the ROM, no --no-verify
  - `git commit` only when the tree builds byte-identical
"""
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def block(msg: str) -> None:
    print(f"BLOCKED by .claude/hooks/guard.py: {msg}", file=sys.stderr)
    sys.exit(2)


def main() -> None:
    try:
        data = json.load(sys.stdin)
    except ValueError:
        return
    tool = data.get("tool_name", "")
    inp = data.get("tool_input", {}) or {}

    if tool in ("Edit", "Write", "MultiEdit", "NotebookEdit"):
        path = str(inp.get("file_path", "")).replace("\\", "/")
        if re.search(r"\.(bin|smd|gen)$", path, re.I):
            block("ROM/binary files are read-only.")
        if "/build_tools/" in path or re.search(r"(^|/)build/", path):
            block("build_tools/ is vendored and build/ is generated; don't edit them.")
        text = json.dumps(inp)
        if "ROM_SHA1" in text and re.search(r"(tools/(build|m68k)\.py)$", path):
            block("the expected ROM hash is fixed; a mismatch means the source is wrong.")
        return

    if tool in ("Bash", "PowerShell"):
        cmd = str(inp.get("command", ""))
        if re.search(r"build_tools[\\/][^\s\"']*(asw|asl|p2bin)", cmd) or re.search(r"(^|[\s;&|])(asw|asl|p2bin)(\.exe)?\s", cmd):
            block("use `uv run tools/build.py` (the only build path), not the assembler directly.")
        if re.search(r"split\.py\b.*--force", cmd):
            block("split.py --force overwrites all hand edits. Ask the user if a re-split is really intended.")
        if "--no-verify" in cmd:
            block("don't skip hooks.")
        if re.search(r"git\s+add\b.*(-f|--force)", cmd) and re.search(r"\.(bin|smd|gen)\b", cmd):
            block("never commit the ROM.")
        if re.search(r"\bgit\b[^|;&]*\bcommit\b", cmd):
            # Build the checkout the command runs in (a worktree), not the one holding this hook:
            # otherwise worktree commits are never checked and parallel workers race in one build/.
            root = ROOT
            cwd = data.get("cwd")
            if cwd:
                top = subprocess.run(["git", "rev-parse", "--show-toplevel"], cwd=cwd,
                                     capture_output=True, text=True)
                if top.returncode == 0 and (Path(top.stdout.strip()) / "tools" / "build.py").exists():
                    root = Path(top.stdout.strip())
            r = subprocess.run(["uv", "run", "tools/build.py", "--quiet"], cwd=root,
                               capture_output=True, text=True, timeout=600)
            if r.returncode != 0:
                block("tree does not build byte-identical; fix before committing:\n" + (r.stdout + r.stderr)[-2000:])


if __name__ == "__main__":
    main()
