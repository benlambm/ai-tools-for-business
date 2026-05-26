#!/bin/zsh
# Wrapper: run imagegen from the book root using BookProjects venv.
set -euo pipefail

BOOK_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
IMAGEGEN_BIN="${BOOKPROJECTS_VENV:-$HOME/BookProjects/.venv}/bin/imagegen"

if [[ ! -x "$IMAGEGEN_BIN" ]]; then
  echo "imagegen not found at $IMAGEGEN_BIN" >&2
  echo "Install: cd ~/BookProjects && python3 -m venv .venv && .venv/bin/pip install -e ." >&2
  exit 1
fi

cd "$BOOK_ROOT"
exec "$IMAGEGEN_BIN" --book-root "$BOOK_ROOT" "$@"
