#!/bin/zsh
# Phase 0: three Chapter 1 concepts × each configured provider (up to six drafts).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
"$SCRIPT_DIR/imagegen.zsh" providers
"$SCRIPT_DIR/imagegen.zsh" lint 01
echo "Generating Phase 0 comparison set (hero, agent-assist, alert-noise) …"
# No --providers: uses every configured provider (gemini-only is fine).
"$SCRIPT_DIR/imagegen.zsh" gen 01 --all
echo "Drafts written under images/_drafts/01/"
echo "Review in Finder, then lock images/STYLE.md before bulk generation."
