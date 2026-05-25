#!/usr/bin/env bash
set -euo pipefail

if command -v quarto >/dev/null 2>&1; then
  exec quarto render "$@"
fi

LOCAL_QUARTO="/Users/benlamb/BookProjects/.toolcache/quarto-pkg/quarto-core.pkg/Payload/bin/quarto"
if [[ -x "${LOCAL_QUARTO}" ]]; then
  exec "${LOCAL_QUARTO}" render "$@"
fi

echo "Quarto is not installed. Install it with Homebrew cask or run the local package extraction again." >&2
exit 1
