# ``W3C_SVG``

@Metadata {
    @DisplayName("W3C SVG")
    @TitleHeading("Swift Standards")
}

Foundation-free Swift encoding of the W3C SVG 2 specification, following the
specification's chapter structure.

## Overview

Types mirror the SVG 2 chapters directly: each chapter becomes a namespace
nested in ``W3C_SVG2``, and each element becomes a value type inside it. Basic
shapes are backed by Geometry Primitives, so a `W3C_SVG2.Shapes.Circle` is a
real geometric circle carrying area, containment and bounding-box operations as
well as SVG's `cx` / `cy` / `r` attribute spelling.

```swift
import W3C_SVG

let circle = W3C_SVG2.Shapes.Circle(cx: 50, cy: 50, r: 40)
let fill = W3C_SVG2.Types.Color.hex("FF0000")
let box = W3C_SVG2.Types.ViewBox(width: 100, height: 200)
```

## Topics

### Foundational

- ``W3C_SVG2/Types``
- ``W3C_SVG2/Document``
- ``W3C_SVG2/Styling``

### Coordinates

- ``W3C_SVG2/Coordinates``

### Graphics Elements

- ``W3C_SVG2/Paths``
- ``W3C_SVG2/Shapes``
- ``W3C_SVG2/Text``
- ``W3C_SVG2/Embedded``

### Rendering

- ``W3C_SVG2/Painting``
- ``W3C_SVG2/PaintServers``

### Interactivity

- ``W3C_SVG2/Scripting``
- ``W3C_SVG2/Linking``
