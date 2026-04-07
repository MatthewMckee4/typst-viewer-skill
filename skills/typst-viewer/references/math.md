# Typst Math Reference

## Inline vs Block

```typst
Inline: $x^2 + y^2$            // no spaces after/before $
Block:  $ x^2 + y^2 $          // spaces -> centered display equation
```

## Fractions

```typst
$ 1/2 $                         // shorthand
$ (x + 1) / (y - 1) $          // grouping parens removed in output
$ frac(a, b) $                  // explicit function
```

## Subscripts and Superscripts

```typst
$ x_1, x^2, x_1^2 $
$ sum_(i=0)^n a_i $             // grouping with parens
$ attach(Pi, tl: 1, tr: 2, bl: 3, br: 4) $  // 6-position
```

## Roots

```typst
$ sqrt(x) $
$ root(3, x) $                  // cube root: root(index, radicand)
```

## Matrices

```typst
$ mat(1, 2; 3, 4) $             // semicolons separate rows
$ mat(delim: "[", 1, 2; 3, 4) $ // square brackets
$ mat(1, 0, 1; 0, 1, 2; augment: #2) $  // augmented matrix
```

## Vectors

```typst
$ vec(a, b, c) $
$ vec(delim: "[", 1, 2, 3) $
```

## Cases (Piecewise)

```typst
$ f(x) = cases(
  1 &"if" x > 0,
  0 &"if" x = 0,
  -1 &"if" x < 0,
) $
```

## Alignment and Line Breaks

```typst
$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $
```

## Accents

| Function | Result |
|----------|--------|
| `hat(x)` | circumflex |
| `tilde(x)` | tilde |
| `dot(x)` | single dot |
| `macron(x)` | bar/macron |
| `arrow(x)` | right arrow over |
| `overline(x)` | overline |

## Decorations

```typst
$ underbrace(1 + 2 + ... + n, n "terms") $
$ overbrace(a + b, "sum") $
$ cancel(x) $                   // strikethrough
```

## Delimiters

```typst
$ abs(x) $       // |x|
$ norm(x) $      // ||x||
$ floor(x) $     // floor
$ ceil(x) $      // ceiling
$ binom(n, k) $  // binomial coefficient
```

## Font Variants

```typst
$ bb(R) $        // blackboard bold (also: NN, RR, QQ, CC, ZZ)
$ cal(F) $       // calligraphic
$ frak(g) $      // fraktur
$ bold(A) $      // bold
$ upright(A) $   // upright (non-italic)
$ sans(A) $      // sans-serif
$ mono(x) $      // monospace
```

## Greek Letters

All available directly in math mode:

```
alpha beta gamma delta epsilon zeta eta theta iota kappa lambda
mu nu xi pi rho sigma tau upsilon phi chi psi omega
```

Uppercase: `Alpha, Beta, Gamma, Delta, ...`

Variants: `epsilon.alt, theta.alt, phi.alt, sigma.alt`

## Common Symbols

### Sets and Logic
```
in, in.not, subset, subset.eq, supset, supset.eq
union, inter, union.big, inter.big, emptyset
and, or, not, forall, exists, exists.not
```

### Arrows
```
arrow.r (->), arrow.l (<-), arrow.r.double (=>)
arrow.l.r (<->), arrow.l.r.double (<=>), |-> (mapsto)
```

### Relations
```
eq (=), eq.not (!=), lt (<), gt (>), lt.eq (<=), gt.eq (>=)
approx, equiv, tilde.eq, prop
prec, succ, lt.double (<<), gt.double (>>)
```

### Calculus
```
integral, integral.double, integral.triple, integral.cont
partial, dif, nabla, sum, product, infinity (oo)
```

### Dots
```
dots.h (...)       dots.h.c (cdots)     dots.v (vdots)
dots.down (ddots)  dot.c (centered dot)
```

### Other
```
plus.minus (pm), minus.plus (mp), times, div
star.op, compose, tack.r (turnstile), tack.r.double (models)
```

## Operators

Predefined (rendered upright): `sin cos tan log ln exp lim sup inf max min det dim gcd lcm ker hom`

Custom operator:
```typst
$ op("argmax", limits: #true)_(x in RR) f(x) $
```

## Equation Numbering

```typst
#set math.equation(numbering: "(1)")

$ E = m c^2 $ <einstein>

From @einstein we see...
```

## Limits vs Scripts

```typst
$ limits(sum)_0^n $    // force above/below positioning
$ scripts(sum)_0^n $   // force side positioning
```
