# Typst Diagrams Reference

## Package Decision Guide

| Need | Package | Import |
|------|---------|--------|
| Geometric shapes, custom drawings, trees | CeTZ | `@preview/cetz:0.5.0` |
| Flowcharts, commutative diagrams, state machines | Fletcher | `@preview/fletcher:0.5.8` |
| Data plots (scatter, bar, pie) | plotst | `@preview/plotst:0.2.0` |

## CeTZ -- General Drawing

### Basic Usage

```typst
#import "@preview/cetz:0.5.0"

#cetz.canvas({
  import cetz.draw: *

  // Shapes
  circle((0, 0), radius: 1)
  rect((2, -1), (4, 1), fill: blue.lighten(80%))
  line((0, 0), (2, 1), stroke: 2pt + red)
  content((3, 0), [$f(x)$])

  // Arc
  arc((0, 0), start: 0deg, stop: 90deg, radius: 2)
})
```

### Styling

```typst
#cetz.canvas({
  import cetz.draw: *
  set-style(stroke: (paint: blue, thickness: 1.5pt))
  circle((0, 0))
  line((0, 0), (2, 2), mark: (end: ">"))
})
```

### Tree Diagram

```typst
#import "@preview/cetz:0.5.0": canvas, draw, tree

#canvas(length: 1cm, {
  import draw: *
  let data = ([Root], ([A], [A1], [A2]), ([B], [B1]))

  tree.tree(data, spread: 2.5, grow: 1.5,
    draw-node: (node, ..) => {
      circle((), radius: .45, stroke: none, fill: gray.lighten(70%))
      content((), node.content)
    },
    draw-edge: (from, to, ..) => {
      line((a: from, number: .6, b: to),
           (a: to, number: .6, b: from), mark: (end: ">"))
    })
})
```

## Fletcher -- Flowcharts and Diagrams

### Simple Flowchart

```typst
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#diagram(
  node((0,0), [Start], shape: fletcher.shapes.pill),
  edge("-|>"),
  node((1,0), [Process], shape: rect),
  edge("-|>"),
  node((2,0), [End], shape: fletcher.shapes.pill),
)
```

### Commutative Diagram (Math Shorthand)

```typst
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#diagram(cell-size: 15mm, $
  A edge(f, ->) & B \
  C edge(g, ->) & D edge(h, ->)
$)
```

### Edge Options

- Arrow marks: `"->"`, `"-|>"`, `"|->"`, `"hook->"`, `"->>"`, `"<->"`, `"<|-|>"`
- Direction: `"r"` (right), `"u"` (up), `"d"` (down), `"l"` (left)
- Bend: `edge("->", bend: 30deg)`
- Labels: `edge($f$, "->")` or `edge("->", label: $f$)`

### Node Shapes

`rect`, `circle`, `diamond`, `fletcher.shapes.pill`, `fletcher.shapes.hexagon`

## plotst -- Data Plots

### Scatter Plot

```typst
#import "@preview/plotst:0.2.0": *

#let data = ((0, 0), (1, 2), (2, 1), (3, 4), (4, 3))
#let x_axis = axis(min: 0, max: 5, step: 1, location: "bottom")
#let y_axis = axis(min: 0, max: 5, step: 1, location: "left")
#let pl = plot(data: data, axes: (x_axis, y_axis))
#scatter_plot(pl, (100%, 30%))
```

### Bar Chart

```typst
#import "@preview/plotst:0.2.0": *

#let data = ((10, "A"), (25, "B"), (15, "C"))
#let y_axis = axis(values: ("", "A", "B", "C"), location: "left")
#let x_axis = axis(min: 0, max: 30, step: 5, location: "bottom")
#let pl = plot(axes: (x_axis, y_axis), data: data)
#bar_chart(pl, (100%, 25%), fill: (blue, red, green))
```

## Built-in Shapes (No Packages Needed)

```typst
#circle(radius: 10pt, fill: blue)
#rect(width: 50pt, height: 30pt, fill: red, stroke: 1pt)
#line(start: (0pt, 0pt), end: (50pt, 30pt))
#polygon(fill: green, (0pt, 0pt), (50pt, 0pt), (25pt, 40pt))
#square(size: 20pt, fill: orange)
```
