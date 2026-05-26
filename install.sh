#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_BIN="$SOURCE_DIR/bin/termcode"
INSTALL_DIR="${TERMCODE_INSTALL_DIR:-$HOME/.local/bin}"
INSTALL_BIN="$INSTALL_DIR/termcode"

if [ ! -f "$SOURCE_BIN" ]; then
  echo "Could not find termcode binary at $SOURCE_BIN" >&2
  exit 1
fi

install -d "$INSTALL_DIR"
install -m 0755 "$SOURCE_BIN" "$INSTALL_BIN"

echo "Installed termcode to $INSTALL_BIN"
"$INSTALL_BIN" --version

case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *)
    echo "Add this to your shell config if termcode is not found:"
    echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
    ;;
esac
