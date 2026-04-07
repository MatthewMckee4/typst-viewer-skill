---
name: typst-viewer
description: Create and display Typst documents as PDFs. Use when you need to show complex mathematics, derivations, proofs, diagrams, tables, or formatted content that renders poorly as plain text. Use when user says "show me", "visualize", "render", "create a diagram", or asks for typeset math.
allowed-tools: Bash Write Read
compatibility: Requires typst CLI installed. Works on macOS, Linux, and Windows.
license: MIT
---

# Typst Viewer

Create Typst documents, compile them to PDF, and open them in the user's PDF viewer.

## Workflow

### Step 1: Create the `.typ` file

Write to a cross-platform temp location. Detect the OS:

```bash
# Get temp directory (cross-platform)
python3 -c "import tempfile; print(tempfile.gettempdir())"
```

Use the result as the base path. Name files descriptively: `claude_typst_<topic>.typ`

### Step 2: Compile

```bash
typst compile <file>.typ <file>.pdf
```

If compilation fails, read the error, fix the `.typ` file, and retry.

### Step 3: Open the PDF

Run `scripts/open-pdf.sh` from the skill directory to detect the best available viewer:

```bash
bash "${CLAUDE_SKILL_DIR}/scripts/open-pdf.sh" <file>.pdf
```

If the script is unavailable, fall back to platform detection:
- **macOS**: `open <file>.pdf`
- **Linux**: `xdg-open <file>.pdf`
- **Windows**: `start <file>.pdf`

## Typst Document Defaults

Always include these settings unless the user specifies otherwise:

```typst
#set page(margin: 30pt)
#set text(size: 11pt)
```

## When to Use

- Multi-line derivations, proofs, or worked examples
- Complex equations that are hard to read as plain text
- Tables, diagrams, or structured layouts
- The user explicitly asks to "show me", "write this up", or "create a diagram"

## When NOT to Use

- Simple one-line answers or formulas
- Code explanations
- Anything that reads fine as plain markdown

## References

For Typst syntax details, consult these files in the skill directory:

- `references/math.md` -- Mathematical typesetting (equations, fractions, matrices, symbols, accents)
- `references/basics.md` -- Document structure, markup, set/show rules, text formatting
- `references/diagrams.md` -- Diagrams with CeTZ, flowcharts with Fletcher, plots with plotst
- `references/viewer.md` -- PDF viewer detection logic and supported viewers

## Important

- ALWAYS compile and verify the output before showing the user
- If typst is not installed, tell the user to install it: `brew install typst` (macOS), `cargo install typst-cli`, or download from https://typst.app
- Keep documents focused -- one concept per file, not entire textbooks
