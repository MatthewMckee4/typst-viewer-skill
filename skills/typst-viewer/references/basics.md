# Typst Basics Reference

## Document Setup

```typst
#set document(title: "My Document")
#set page(margin: 30pt)
#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 11pt, font: "New Computer Modern")
#set par(justify: true)
#set heading(numbering: "1.")
```

## Headings

```typst
= Level 1
== Level 2
=== Level 3
```

## Text Formatting

```typst
*bold*
_italic_
`inline code`
#underline[underlined]
#strike[strikethrough]
#smallcaps[small caps]
#text(fill: red)[colored text]
#text(size: 14pt)[sized text]
```

## Lists

```typst
- Bullet item
- Another item
  - Nested

+ Numbered item
+ Another

/ Term: Definition
/ Another: Its definition
```

## Links and References

```typst
https://example.com            // auto-linked
#link("https://example.com")[click here]
See @my-label
= My Section <my-label>
```

## Tables

```typst
#table(
  columns: (auto, auto, auto),
  [*Name*], [*Age*], [*City*],
  [Alice], [30], [London],
  [Bob], [25], [Paris],
)
```

With more control:
```typst
#table(
  columns: (1fr, 2fr),
  align: (left, center),
  stroke: 0.5pt,
  inset: 8pt,
  table.header([*Key*], [*Value*]),
  [alpha], [$0.05$],
  [beta], [$0.95$],
)
```

## Images

```typst
#image("path/to/image.png", width: 80%)
#figure(
  image("plot.png", width: 70%),
  caption: [A descriptive caption],
)
```

## Code Blocks

````typst
```python
def hello():
    print("world")
```
````

## Page Breaks

```typst
#pagebreak()
```

## Outline (Table of Contents)

```typst
#outline()
#outline(title: none)           // no title
#outline(indent: auto)          // indented
```

## Variables and Functions

```typst
#let name = "World"
Hello, #name!

#let greet(name) = [Hello, #name!]
#greet("World")
```

## Conditionals and Loops

```typst
#if x > 0 [positive] else [non-positive]

#for i in range(5) {
  [Item #i. ]
}
```

## Show Rules

```typst
// Restyle all headings
#show heading: it => [
  #set text(blue)
  #it.body
]

// Show-set (apply set rule to specific elements)
#show heading: set text(font: "Georgia")
```

## Boxes and Blocks

```typst
#box(stroke: 1pt, inset: 5pt)[inline box]
#block(fill: luma(230), inset: 10pt, radius: 4pt)[
  A highlighted block of content.
]
```

## Raw Strings

```typst
#raw("verbatim text")
#raw(block: true, lang: "python", "print('hello')")
```

## Colors

```typst
red, blue, green, black, white, gray
luma(200)                       // grayscale 0-255
rgb("#ff0000")                  // hex
rgb(255, 0, 0)                  // rgb values
```
