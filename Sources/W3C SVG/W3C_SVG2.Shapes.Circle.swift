//
//  W3C_SVG2.Shapes.Circle.swift
//  swift-w3c-svg
//
//  The 'circle' element (SVG 2 Section 10.3)
//

extension W3C_SVG2.Shapes {
    /// The 'circle' element
    ///
    /// W3C SVG 2 Section 10.3
    /// https://www.w3.org/TR/SVG2/shapes.html#CircleElement
    ///
    /// The 'circle' element defines a circle based on a center point and a radius.
    ///
    /// ## Geometry Properties
    ///
    /// - **cx**: The x-axis coordinate of the center of the circle (default: 0)
    /// - **cy**: The y-axis coordinate of the center of the circle (default: 0)
    /// - **r**: The radius of the circle (must be ≥ 0)
    ///
    /// A negative value for 'r' is an error. A value of zero disables rendering of the element.
    ///
    /// ## Geometry Operations
    ///
    /// As a `Geometry.Circle`, this type provides rich geometric operations:
    /// - `area` - The area of the circle (π × r²)
    /// - `circumference` - The circumference (2π × r)
    /// - `contains(_:)` - Check if a point is inside the circle
    /// - `intersects(_:)` - Check if another circle intersects
    /// - `boundingBox` - Axis-aligned bounding rectangle
    /// - `translated(by:)`, `scaled(by:)` - Transformations
    ///
    /// ## Example
    ///
    /// ```swift
    /// let circle = W3C_SVG2.Shapes.Circle(cx: 50, cy: 50, r: 40)
    ///
    /// // Geometry operations
    /// let area = circle.area
    /// let hitTest = circle.contains(W3C_SVG2.Point(x: .init(60), y: .init(60)))
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Ellipse``
    /// - ``Rectangle``
    public typealias Circle = W3C_SVG2.Circle
}

// MARK: - SVG-Style API

extension W3C_SVG2.Circle {
    /// The x-axis coordinate of the center of the circle
    ///
    /// SVG attribute: `cx`
    @inlinable
    public var cx: W3C_SVG2.X { center.x }

    /// The y-axis coordinate of the center of the circle
    ///
    /// SVG attribute: `cy`
    @inlinable
    public var cy: W3C_SVG2.Y { center.y }

    /// The radius of the circle
    ///
    /// SVG attribute: `r`
    @inlinable
    public var r: W3C_SVG2.Radius { radius }

    /// Creates a circle element using SVG-style parameters
    ///
    /// - Parameters:
    ///   - cx: The x-axis coordinate of the center (default: 0)
    ///   - cy: The y-axis coordinate of the center (default: 0)
    ///   - r: The radius (default: 0)
    @inlinable
    public init(
        cx: W3C_SVG2.X = .init(0),
        cy: W3C_SVG2.Y = .init(0),
        r: W3C_SVG2.Radius = .init(0)
    ) {
        self.init(center: .init(x: cx, y: cy), radius: r)
    }
}

// MARK: - SVGElementType Conformance

extension W3C_SVG2.Circle: SVGElementType {
    /// SVG element tag name
    public static let tagName = "circle"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
