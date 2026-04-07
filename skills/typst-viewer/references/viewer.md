# PDF Viewer Detection

## Strategy

Detect the user's OS and available PDF viewers, preferring dedicated readers over generic openers.

## Viewer Priority (by platform)

### macOS

1. `sioyek` -- research-focused PDF reader
2. `skim` -- `/Applications/Skim.app`
3. `zathura`
4. `open` -- system default (always available)

### Linux

1. `sioyek`
2. `zathura`
3. `evince`
4. `okular`
5. `xdg-open` -- desktop default (always available)

### Windows

1. `sioyek`
2. `SumatraPDF`
3. `start` -- system default (always available)

## Detection Script

The `scripts/open-pdf.sh` script handles detection automatically. It:

1. Checks the OS via `uname` (or presence of `/proc/version` for WSL)
2. Tries viewers in priority order using `command -v`
3. Falls back to the system opener
4. Passes `--new-window` to sioyek if available (avoids hijacking an existing session)

## Adding a New Viewer

Edit `scripts/open-pdf.sh` and add the viewer command to the appropriate platform section in the `try_viewers` function.

## Manual Override

Users can set a preferred viewer by setting the `TYPST_VIEWER` environment variable:

```bash
export TYPST_VIEWER="zathura"
```

The script checks this variable first before auto-detecting.
