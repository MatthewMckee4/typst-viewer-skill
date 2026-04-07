# typst-viewer-skill

Render complex maths, diagrams, and proofs as PDFs using [Typst](https://typst.app/). Works on macOS, Linux, and Windows.

## Installation

```bash
git clone https://github.com/MatthewMckee4/typst-viewer-skill.git
cp -r typst-viewer-skill/skills/typst-viewer ~/.claude/skills/
```

You'll also need the [Typst CLI](https://github.com/typst/typst/releases) installed (`brew install typst` on macOS, or `cargo install typst-cli`).

## What it does

When you ask your AI agent to show you a derivation, proof, or diagram, this skill writes a Typst document, compiles it to PDF, and opens it in your PDF viewer. It auto-detects viewers like sioyek, zathura, Skim, and evince, falling back to your system default. You can override this with the `TYPST_VIEWER` environment variable.

The skill includes reference docs for Typst's math syntax, document formatting, and diagram packages (CeTZ, Fletcher, plotst) so the agent can produce correct output without needing to look anything up.

## License

MIT
