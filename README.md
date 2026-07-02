# swift-w3c-svg

[![CI](https://github.com/swift-w3c/swift-w3c-svg/workflows/CI/badge.svg)](https://github.com/swift-w3c/swift-w3c-svg/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Foundation-free Swift implementation of W3C SVG 2 specification.

## Overview

`swift-w3c-svg` provides a literal encoding of the W3C SVG 2 specification in Swift, following the specification's chapter structure with zero external dependencies.

## W3C SVG 2 Specification

This package implements the [W3C SVG 2 specification](https://www.w3.org/TR/SVG2/) with namespaced types that directly map to SVG 2 chapters:

### Foundational
- **Types** (Chapter 4): Basic data types - Length, Color, Transform, ViewBox ✓
- **Document** (Chapter 5): SVG, Group, Defs, Symbol, Use ✓
- **Styling** (Chapter 6): CSS and presentation (infrastructure ready)

### Geometry & Coordinates
- **Geometry** (Chapter 7): Positioning and sizing properties (infrastructure ready)
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

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-w3c/swift-w3c-svg", from: "0.3.0")
]
```

## Usage

### Basic Shapes (Chapter 10)

```swift
import W3C_SVG

// Create shapes using W3C_SVG2 namespace
let circle = W3C_SVG2.Shapes.Circle(cx: 50, cy: 50, r: 40)
let rect = W3C_SVG2.Shapes.Rectangle(x: 10, y: 10, width: 100, height: 80)
let ellipse = W3C_SVG2.Shapes.Ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
let line = W3C_SVG2.Shapes.Line(x1: 0, y1: 0, x2: 100, y2: 100)

// Rounded rectangle
let rounded = W3C_SVG2.Shapes.Rectangle(x: 10, y: 10, width: 100, height: 80, rx: 5, ry: 5)
```

### Value Types (Chapter 4)

```swift
// Length values with units
let pixels = W3C_SVG2.Types.Length.px(100)       // "100px"
let percent = W3C_SVG2.Types.Length.percentage(50) // "50%"
let ems = W3C_SVG2.Types.Length.em(2.5)          // "2.5em"

// Color values
let red = W3C_SVG2.Types.Color.named("red")
let hex = W3C_SVG2.Types.Color.hex("FF0000")
let rgb = W3C_SVG2.Types.Color.rgb(r: 255, g: 0, b: 0)
let rgba = W3C_SVG2.Types.Color.rgba(r: 255, g: 0, b: 0, a: 0.5)

// Transform functions
let translate = W3C_SVG2.Types.Transform.translate(x: 10, y: 20)
let rotate = W3C_SVG2.Types.Transform.rotate(angle: 45)
let scale = W3C_SVG2.Types.Transform.scale(x: 2, y: 3)

// ViewBox
let viewBox = W3C_SVG2.Types.ViewBox(width: 100, height: 200)
```

## Architecture

Following the Swift Standards Package Organization Process:

- **Empty enums for namespaces** - `W3C_SVG2` cannot be instantiated
- **Literal spec encoding** - File organization matches SVG 2 chapter structure
- **Zero external dependencies** - Foundation-free implementation
- **Sendable & Equatable** - Swift 6 concurrency support
- **Comprehensive documentation** - W3C SVG 2 section references throughout

## Platform Support

- macOS 15+
- iOS 18+
- tvOS 18+
- watchOS 11+
- Swift 6.2+

## Standards Reference

- [W3C SVG 2 Specification](https://www.w3.org/TR/SVG2/)
- Direct mapping from specification chapters to Swift namespaces
- Each type includes W3C section reference in documentation

## License

Apache License 2.0

// Create a path
let path = Path(d: "M10 10 L90 90")
```

### Value Types

```swift
// SVGLength with units
let pixels = SVGLength.px(100)
let percentage = SVGLength.percentage(50)
let em = SVGLength.em(2.5)

print(pixels.stringValue)      // "100px"
print(percentage.stringValue)  // "50%"

// SVGColor
let hex = SVGColor.hex("#FF5733")
let rgb = SVGColor.rgb(r: 255, g: 87, b: 51)
let named = SVGColor.named("red")

print(hex.stringValue)   // "#FF5733"
print(rgb.stringValue)   // "rgb(255,87,51)"

// SVGViewBox
let viewBox = SVGViewBox(width: 100, height: 200)
print(viewBox.stringValue)  // "0 0 100 200"
```

## Usage Examples

### Transformations

```swift
// Create transforms
let translate = SVGTransform.translate(x: 10, y: 20)
let rotate = SVGTransform.rotate(angle: 45)
let scale = SVGTransform.scale(x: 2.0, y: 2.0)

print(translate.stringValue)  // "translate(10 20)"
print(rotate.stringValue)     // "rotate(45)"

// Use in group
let group = G(transform: translate)
// Or multiple transforms
let multiGroup = G(transform: [translate, rotate, scale])
```

### Gradients

```swift
// Linear gradient
let gradient = LinearGradient(
    id: "myGradient",
    x1: "0%",
    y1: "0%",
    x2: "100%",
    y2: "100%"
)

// Radial gradient
let radial = RadialGradient(
    id: "radialGrad",
    cx: "50%",
    cy: "50%",
    r: "50%"
)

// Gradient stop
let stop = Stop(
    offset: "50%"
)
```

### Complex Shapes

```swift
// Ellipse
let ellipse = Ellipse(cx: 100, cy: 50, rx: 80, ry: 40)

// Line
let line = Line(x1: 0, y1: 0, x2: 100, y2: 100)

// Polygon
let triangle = Polygon(
    points: "50,0 100,100 0,100"
)

// Polyline
let polyline = Polyline(
    points: "0,0 50,50 100,0"
)
```

### Text Elements

```swift
// Text
let text = Text(
    x: 10,
    y: 20,
    content: "Hello SVG"
)

// Text span
let tspan = TSpan(
    x: 10,
    y: 30,
    dx: 5,
    dy: 10
)
```

### Container Elements

```swift
// Definitions container
let defs = Defs()

// Symbol for reusable graphics
let symbol = Symbol(
    id: "mySymbol",
    viewBox: "0 0 100 100"
)

// Use element to reference symbols
let use = Use(
    href: "#mySymbol",
    x: 50,
    y: 50
)

// Clip path
let clipPath = ClipPath(
    id: "myClip"
)

// Mask
let mask = Mask(
    id: "myMask",
    x: 0,
    y: 0,
    width: 100,
    height: 100
)
```

### SVG Attributes

```swift
// Fill rules
let fillRule: SVGFillRule = .evenodd  // or .nonzero

// Line caps
let lineCap: SVGLineCap = .round  // .butt, .square

// Line joins
let lineJoin: SVGLineJoin = .miter  // .round, .bevel

// Text anchors
let anchor: SVGTextAnchor = .middle  // .start, .end

// Display
let display: SVGDisplay = .none  // .inline, .block
```

## Architecture

### Element Protocol

All SVG elements conform to `SVGElementType`:

```swift
public protocol SVGElementType {
    static var tagName: String { get }
    static var isSelfClosing: Bool { get }
}
```

### Value Types

The package includes type-safe value types:

- `SVGPoint`: 2D point (x, y)
- `SVGSize`: Size (width, height)
- `SVGRect`: Rectangle (x, y, width, height)
- `SVGViewBox`: ViewBox (minX, minY, width, height)
- `SVGColor`: Color values (named, hex, rgb, rgba)
- `SVGLength`: Lengths with units (px, %, em, ex, etc.)
- `SVGTransform`: Transformations (translate, rotate, scale, skew, matrix)

### Type Safety

All types are:
- `Sendable` for Swift 6.0 concurrency
- `Equatable` for value comparisons
- Immutable with `let` properties

## Related Packages

### Used By

- [swift-svg](https://github.com/swift-foundations/swift-svg): A Swift package for type-safe SVG generation.
- [swift-svg-printer](https://github.com/coenttb/swift-svg-printer): A Swift package for rendering SVG to String or bytes.

## Requirements

- Swift 6.0+
- macOS 14+ / iOS 17+ / Linux

## License

This package is licensed under the Apache 2.0 License. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

For issues, questions, or contributions, please visit the [GitHub repository](https://github.com/swift-standard/swift-svg-standard).
