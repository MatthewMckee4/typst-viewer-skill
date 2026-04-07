# skill-typst-viewer

An [Agent Skill](https://github.com/anthropics/agent-skills) that creates, compiles, and opens [Typst](https://typst.app/) documents as PDFs. Useful for rendering complex mathematics, diagrams, proofs, and formatted content that reads poorly as plain text.

Works on **macOS**, **Linux**, and **Windows** (including WSL). Auto-detects your installed PDF viewer.

## Installation

### As a skill (any AI agent supporting Agent Skills)

Copy the `skills/typst-viewer` folder into your agent's skills directory:

```bash
# For Claude Code (personal, all projects)
cp -r skills/typst-viewer ~/.claude/skills/

# For a specific project
cp -r skills/typst-viewer .claude/skills/
```

### From GitHub (clone)

```bash
git clone https://github.com/MatthewMckee4/skill-typst-viewer.git
cp -r skill-typst-viewer/skills/typst-viewer ~/.claude/skills/
```

## Prerequisites

- [Typst](https://typst.app/) CLI

  ```bash
  # macOS
  brew install typst

  # Cargo (any platform)
  cargo install typst-cli

  # Or download from https://github.com/typst/typst/releases
  ```

- A PDF viewer (auto-detected, or set `TYPST_VIEWER` env var)

## Usage

The skill activates automatically when you need to display complex math, derivations, or diagrams. You can also reference it explicitly.

### Example prompts

- "Derive the Black-Scholes formula and show me the typeset result"
- "Create a diagram of a binomial tree with 3 periods"
- "Show me the proof of the fundamental theorem of calculus"
- "Render a commutative diagram for this exact sequence"

## PDF Viewer

The skill auto-detects your PDF viewer in this priority order:

| macOS | Linux | Windows |
|-------|-------|---------|
| sioyek | sioyek | sioyek |
| Skim | zathura | SumatraPDF |
| zathura | evince | system default |
| system default | okular | |
| | system default | |

Override with the `TYPST_VIEWER` environment variable:

```bash
export TYPST_VIEWER="zathura"
```

## Structure

```
skill-typst-viewer/
├── skills/
│   └── typst-viewer/
│       ├── SKILL.md                # Main skill instructions
│       ├── references/
│       │   ├── math.md             # Math typesetting reference
│       │   ├── basics.md           # Document structure and formatting
│       │   ├── diagrams.md         # CeTZ, Fletcher, plotst diagrams
│       │   └── viewer.md           # PDF viewer detection docs
│       └── scripts/
│           └── open-pdf.sh         # Cross-platform PDF opener
└── README.md
```

## License

MIT
