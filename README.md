# swift-w3c-svg

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)
[![CI](https://github.com/swift-w3c/swift-w3c-svg/workflows/CI/badge.svg)](https://github.com/swift-w3c/swift-w3c-svg/actions/workflows/ci.yml)

Foundation-free Swift implementation of the W3C SVG 2 specification.

## Overview

`swift-w3c-svg` provides a literal encoding of the W3C SVG 2 specification in Swift, following the specification's chapter structure. The implementation is Foundation-free and depends only on the Swift Primitives layer (Format, Geometry, Parser).

## W3C SVG 2 Specification

This package implements the [W3C SVG 2 specification](https://www.w3.org/TR/SVG2/) with namespaced types that directly map to SVG 2 chapters:

### Foundational
- **Types** (Chapter 4): Basic data types — Length, Color, Transform, ViewBox ✓
- **Document** (Chapter 5): SVG, Group, Defs, Symbol, Use ✓
- **Styling** (Chapter 6): CSS and presentation (infrastructure ready)

### Geometry & Coordinates
- **Geometry** (Chapter 7): Positioning and sizing surfaced as typealiases on `W3C_SVG2` (`X`, `Y`, `Width`, `Height`, `Radius`) over Geometry Primitives — not a nested namespace
- **Coordinates** (Chapter 8): Coordinate systems and transforms (infrastructure ready)

### Graphics Elements
- **Paths** (Chapter 9): Path elements and data (infrastructure ready)
- **Shapes** (Chapter 10): Circle, Rectangle, Ellipse, Line, Polyline, Polygon ✓
- **Text** (Chapter 11): Text content elements (infrastructure ready)
- **Embedded** (Chapter 12): Embedded content (infrastructure ready)

### Rendering
- **Painting** (Chapter 13): Fill, stroke, markers (infrastructure ready)
- **PaintServers** (Chapter 14): LinearGradient, RadialGradient, Stop, Pattern ✓

### Interactivity
- **Scripting** (Chapter 15): Interactivity and events (infrastructure ready)
- **Linking** (Chapter 16): Hyperlinks and views (infrastructure ready)

## Installation

Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/swift-w3c/swift-w3c-svg.git", from: "0.1.0")
]
```

Add the product to a target that needs it:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "W3C SVG", package: "swift-w3c-svg")
    ]
)
```

## Usage

### Basic Shapes (Chapter 10)

```swift
import W3C_SVG

let circle = W3C_SVG2.Shapes.Circle(cx: 50, cy: 50, r: 40)
let rect = W3C_SVG2.Shapes.Rectangle(x: 10, y: 10, width: 100, height: 80)
let ellipse = W3C_SVG2.Shapes.Ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
let line = W3C_SVG2.Shapes.Line(x1: 0, y1: 0, x2: 100, y2: 100)
```

### Value Types (Chapter 4)

```swift
import W3C_SVG

// Length values with units
let pixels = W3C_SVG2.Types.Length.px(100)         // "100px"
let percent = W3C_SVG2.Types.Length.percentage(50) // "50%"
let ems = W3C_SVG2.Types.Length.em(2.5)            // "2.5em"

// Color values
let red = W3C_SVG2.Types.Color.named("red")
let hex = W3C_SVG2.Types.Color.hex("FF0000")
let rgb = W3C_SVG2.Types.Color.rgb(r: 255, g: 0, b: 0)

// Transform functions
let translate = W3C_SVG2.Types.Transform.translate(x: 10, y: 20)
let rotate = W3C_SVG2.Types.Transform.rotate(angle: 45)

// ViewBox
let viewBox = W3C_SVG2.Types.ViewBox(width: 100, height: 200)
```

## Platform Support

- macOS 26+
- iOS 26+
- tvOS 26+
- watchOS 26+
- visionOS 26+
- Swift 6.3+

## Standards Reference

- [W3C SVG 2 Specification](https://www.w3.org/TR/SVG2/)

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
