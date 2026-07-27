//
//  W3C_SVG2.swift
//  swift-w3c-svg
//
//  Main namespace for W3C SVG 2 specification
//

/// W3C SVG 2 — Scalable Vector Graphics
///
/// Foundation-free Swift implementation of W3C SVG 2 specification.
///
/// ## Overview
///
/// This package provides Swift types and interfaces for the Scalable Vector Graphics (SVG) 2
/// specification as defined by the World Wide Web Consortium (W3C). It follows the specification
/// structure literally, providing a direct mapping from SVG2 chapters to Swift namespaces.
///
/// ## Standards Compliance
///
/// - **W3C SVG 2 Specification**: https://www.w3.org/TR/SVG2/
/// - Literal encoding of specification structure
/// - Foundation-free implementation
/// - Depends only on the Swift Primitives layer (Format, Geometry, Parser)
///
/// ## Architecture
///
/// The package follows the SVG2 specification chapter structure with nested enums for namespacing:
///
/// **Foundational**
/// - ``Types`` (Chapter 4): Basic data types and interfaces
/// - ``Document`` (Chapter 5): Document structure elements
/// - ``Styling`` (Chapter 6): CSS and presentation
///
/// **Geometry & Coordinates**
/// - Chapter 7 (positioning and sizing) is surfaced as typealiases directly on
///   ``W3C_SVG2`` — ``W3C_SVG2/X``, ``W3C_SVG2/Y``, ``W3C_SVG2/Width``,
///   ``W3C_SVG2/Height`` — over Geometry Primitives, not as a nested namespace.
/// - ``Coordinates`` (Chapter 8): Coordinate systems and transforms
///
/// **Graphics Elements**
/// - ``Paths`` (Chapter 9): Path elements and data
/// - ``Shapes`` (Chapter 10): Basic shape elements
/// - ``Text`` (Chapter 11): Text content elements
/// - ``Embedded`` (Chapter 12): Embedded content
///
/// **Rendering**
/// - ``Painting`` (Chapter 13): Fill, stroke, markers
/// - ``PaintServers`` (Chapter 14): Gradients and patterns
///
/// **Interactivity**
/// - ``Scripting`` (Chapter 15): Interactivity and events
/// - ``Linking`` (Chapter 16): Hyperlinks and views
///
/// ## Usage
///
/// ### Creating Elements
///
/// ```swift
/// import W3C_SVG
///
/// // Basic shapes (Chapter 10)
/// let circle = W3C_SVG2.Shapes.Circle(cx: 50, cy: 50, r: 40)
/// let rect = W3C_SVG2.Shapes.Rectangle(x: 10, y: 10, width: 100, height: 80)
///
/// // Document structure (Chapter 5)
/// let group = W3C_SVG2.Document.Group(id: "myGroup")
/// let svg = W3C_SVG2.Document.SVG(width: 200, height: 200)
/// ```
///
/// ### Using Value Types
///
/// ```swift
/// // Colors (Chapter 4)
/// let red = W3C_SVG2.Types.Color.hex("FF0000")
/// let blue = W3C_SVG2.Types.Color.rgb(r: 0, g: 0, b: 255)
///
/// // Lengths (Chapter 4)
/// let pixels = W3C_SVG2.Types.Length.px(100)
/// let percent = W3C_SVG2.Types.Length.percentage(50)
///
/// // Transforms (Chapter 8)
/// let translate = W3C_SVG2.Types.Transform.translate(x: 10, y: 20)
/// let rotate = W3C_SVG2.Types.Transform.rotate(angle: 45)
/// ```
///
/// ## Performance
///
/// All types are structs with value semantics, providing zero-cost abstraction over the SVG
/// specification. No Foundation dependency means minimal binary size and fast compile times.
///
/// ## See Also
///
/// - ``Types``
/// - ``Document``
/// - ``Shapes``
/// - ``Painting``
/// - ``PaintServers``
public enum W3C_SVG2 {}
