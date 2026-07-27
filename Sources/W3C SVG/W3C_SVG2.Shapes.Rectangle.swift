//
//  W3C_SVG2.Shapes.Rectangle.swift
//  swift-w3c-svg
//
//  The 'rect' element (SVG 2 Section 10.2)
//

extension W3C_SVG2.Shapes {
    /// The 'rect' element
    ///
    /// W3C SVG 2 Section 10.2
    /// https://www.w3.org/TR/SVG2/shapes.html#RectElement
    ///
    /// The 'rect' element defines a rectangle which is axis-aligned with the current user
    /// coordinate system. Rounded rectangles can be achieved by applying `.rx()` and `.ry()`
    /// modifiers during rendering.
    ///
    /// ## Geometry Properties
    ///
    /// - **x**: The x-coordinate of the rectangle (default: 0)
    /// - **y**: The y-coordinate of the rectangle (default: 0)
    /// - **width**: The width of the rectangle
    /// - **height**: The height of the rectangle
    ///
    /// ## Geometry Operations
    ///
    /// As a `Geometry.Rectangle`, this type provides rich geometric operations:
    /// - `area` - The area of the rectangle (width × height)
    /// - `perimeter` - The perimeter (2 × (width + height))
    /// - `contains(_:)` - Check if a point is inside the rectangle
    /// - `intersects(_:)` - Check if another rectangle intersects
    /// - `union(_:)` - Bounding rectangle containing both
    /// - `intersection(_:)` - Overlapping region
    /// - `translated(by:)`, `scaled(by:)` - Transformations
    ///
    /// ## Example
    ///
    /// ```swift
    /// let rect = W3C_SVG2.Shapes.Rectangle(x: 10, y: 10, width: 100, height: 80)
    ///
    /// // Geometry operations
    /// let area = rect.area
    /// let hitTest = rect.contains(W3C_SVG2.Point(x: .init(50), y: .init(50)))
    ///
    /// // Rounded corners applied at render time
    /// svg {
    ///     rect.rx(.init(5)).ry(.init(5))
    /// }
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Circle``
    /// - ``Ellipse``
    public typealias Rectangle = W3C_SVG2.Rectangle
}

// MARK: - SVG-Style API

extension W3C_SVG2.Rectangle {
    /// The x-coordinate of the rectangle
    ///
    /// SVG attribute: `x`
    /// Note: Maps to `llx` (lower-left x) in geometric terms
    @inlinable
    public var x: W3C_SVG2.X { llx }

    /// The y-coordinate of the rectangle
    ///
    /// SVG attribute: `y`
    /// Note: Maps to `lly` (lower-left y) in geometric terms
    @inlinable
    public var y: W3C_SVG2.Y { lly }
}

// MARK: - SVGElementType Conformance

extension W3C_SVG2.Rectangle: SVGElementType {
    /// SVG element tag name
    public static let tagName = "rect"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
