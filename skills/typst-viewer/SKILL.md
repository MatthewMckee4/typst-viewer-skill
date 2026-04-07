---
name: typst-viewer
description: Create and display Typst documents as PDFs. Use for any response involving non-trivial mathematics, derivations, proofs, diagrams, tables, or formatted content that renders poorly as plain text. TRIGGER when: (1) explaining or teaching concepts that involve 2+ equations or formulas with fractions/subscripts/superscripts/summations, (2) user says "show me", "visualize", "render", "explain" and the answer is mathematical, (3) answering questions about mathematical, financial, scientific, or statistical topics where formulas are central to the explanation, (4) creating diagrams, flowcharts, or structured visual content. DO NOT TRIGGER for simple one-line formulas, pure code explanations, or text that reads fine as markdown.
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

## Document Style by Use Case

**Concept explanations / tutoring**: Use headings, short prose between equations, and worked examples. Structure the document like a clear textbook section — not just a wall of equations. Include a title.

**Derivations / proofs**: Use aligned equations with brief annotations. Number steps if helpful.

**Diagrams / visuals**: Keep surrounding text minimal. Let the diagram speak.

**Quick formula reference**: Minimal prose, just the key formulas with variable definitions.

## When to Use

Use this skill proactively — do not wait for the user to ask for a PDF. If the response would benefit from typeset rendering, use this skill automatically.

- **Explaining mathematical/scientific/financial concepts** where the answer involves 2+ equations (e.g., "explain present value of an annuity", "what is the chain rule", "how does linear regression work")
- **Multi-line derivations, proofs, or worked examples** — step-by-step solutions, induction proofs, integration by parts, etc.
- **Formulas with complex notation** — fractions, summations, integrals, matrices, subscripts/superscripts, Greek letters, or special notation (actuarial, tensor, etc.) that degrade in plain text
- **Tables, diagrams, or structured layouts** — comparison tables, flowcharts, commutative diagrams, plots
- **The user explicitly asks** to "show me", "write this up", "visualize", "render", or "create a diagram"
- **Tutoring and teaching scenarios** — when the user asks "what is", "explain", "how does X work", "can you walk me through" and the answer is mathematical in nature

## When NOT to Use

- A truly simple one-line formula (e.g., "what is the quadratic formula?" → a single equation with no derivation)
- Pure code explanations with no math
- Text-only answers that read fine as markdown (no formulas involved)
- When the user explicitly asks for a plain-text or markdown response

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
- When using this skill proactively (not explicitly requested), keep your text response brief -- a one-line summary of what the PDF covers is enough. The PDF is the primary output.
- Do not duplicate the mathematical content in both your text response and the PDF. The PDF replaces the need for inline markdown math.
