#!/usr/bin/env bash
set -euo pipefail

QUARTO_VERSION="${QUARTO_VERSION:-1.9.37}"
INSTALL_DIR=".quarto-bin"
QUARTO_BIN="${INSTALL_DIR}/quarto"

if [[ -x "${QUARTO_BIN}" ]]; then
  "${QUARTO_BIN}" --version
  exit 0
fi

if [[ "$(uname -s)" != "Linux" ]]; then
  echo "This installer is intended for Netlify Linux builds. Install Quarto locally for desktop rendering." >&2
  exit 1
fi

mkdir -p "${INSTALL_DIR}"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

ARCHIVE="quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
URL="https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/${ARCHIVE}"

curl -fsSL "${URL}" -o "${TMP_DIR}/${ARCHIVE}"
tar -xzf "${TMP_DIR}/${ARCHIVE}" -C "${TMP_DIR}"

EXTRACTED_DIR="$(find "${TMP_DIR}" -maxdepth 1 -type d -name 'quarto-*' | head -n 1)"
cp -R "${EXTRACTED_DIR}/." "${INSTALL_DIR}/"

if [[ ! -x "${QUARTO_BIN}" && -x "${INSTALL_DIR}/bin/quarto" ]]; then
  ln -s "bin/quarto" "${QUARTO_BIN}"
fi

"${QUARTO_BIN}" --version
