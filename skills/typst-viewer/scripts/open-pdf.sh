#!/usr/bin/env bash
set -euo pipefail

# Open a PDF with the best available viewer.
# Usage: open-pdf.sh <file.pdf>

if [ $# -lt 1 ]; then
    echo "Usage: open-pdf.sh <file.pdf>" >&2
    exit 1
fi

PDF_FILE="$1"

if [ ! -f "$PDF_FILE" ]; then
    echo "Error: File not found: $PDF_FILE" >&2
    exit 1
fi

# Allow user override via environment variable
if [ -n "${TYPST_VIEWER:-}" ]; then
    exec $TYPST_VIEWER "$PDF_FILE"
fi

# Detect OS
detect_os() {
    case "$(uname -s)" in
        Darwin) echo "macos" ;;
        Linux)
            if grep -qi microsoft /proc/version 2>/dev/null; then
                echo "wsl"
            else
                echo "linux"
            fi
            ;;
        MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
        *) echo "unknown" ;;
    esac
}

OS="$(detect_os)"

# Try to open with the first available viewer
try_open() {
    local cmd="$1"
    shift
    if command -v "$cmd" &>/dev/null; then
        exec "$cmd" "$@" "$PDF_FILE"
    fi
    return 1
}

case "$OS" in
    macos)
        try_open sioyek --new-window
        try_open open -a Skim
        try_open zathura
        exec open "$PDF_FILE"
        ;;
    linux)
        try_open sioyek --new-window
        try_open zathura
        try_open evince
        try_open okular
        exec xdg-open "$PDF_FILE"
        ;;
    wsl)
        # Convert to Windows path for native viewers
        WIN_PATH="$(wslpath -w "$PDF_FILE")"
        try_open sioyek.exe --new-window
        try_open SumatraPDF.exe
        cmd.exe /c start "" "$WIN_PATH" 2>/dev/null && exit 0
        exec xdg-open "$PDF_FILE"
        ;;
    windows)
        try_open sioyek --new-window
        try_open SumatraPDF
        exec start "" "$PDF_FILE"
        ;;
    *)
        echo "Unknown OS. Trying common openers..." >&2
        try_open xdg-open
        try_open open
        echo "Error: No PDF viewer found. Set TYPST_VIEWER environment variable." >&2
        exit 1
        ;;
esac
