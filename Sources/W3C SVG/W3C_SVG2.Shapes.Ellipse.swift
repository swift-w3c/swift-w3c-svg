//
//  W3C_SVG2.Shapes.Ellipse.swift
//  swift-w3c-svg
//
//  The 'ellipse' element (SVG 2 Section 10.4)
//

extension W3C_SVG2.Shapes {
    /// The 'ellipse' element
    ///
    /// W3C SVG 2 Section 10.4
    /// https://www.w3.org/TR/SVG2/shapes.html#EllipseElement
    ///
    /// The 'ellipse' element defines an ellipse based on a center point and two radii.
    ///
    /// ## Geometry Properties
    ///
    /// - **cx**: The x-axis coordinate of the center of the ellipse (default: 0)
    /// - **cy**: The y-axis coordinate of the center of the ellipse (default: 0)
    /// - **rx**: The x-axis radius of the ellipse (must be ≥ 0)
    /// - **ry**: The y-axis radius of the ellipse (must be ≥ 0)
    ///
    /// ## Geometry Operations
    ///
    /// As a `Geometry.Ellipse`, this type provides rich geometric operations:
    /// - `area` - The area of the ellipse (π × rx × ry)
    /// - `circumference` - Approximate circumference
    /// - `contains(_:)` - Check if a point is inside the ellipse
    /// - `boundingBox` - Axis-aligned bounding rectangle
    /// - `translated(by:)`, `scaled(by:)`, `rotated(by:)` - Transformations
    ///
    /// ## Example
    ///
    /// ```swift
    /// let ellipse = W3C_SVG2.Shapes.Ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
    ///
    /// // Geometry operations
    /// let area = ellipse.area
    /// let hitTest = ellipse.contains(W3C_SVG2.Point(x: .init(100), y: .init(50)))
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Circle``
    /// - ``Rectangle``
    public typealias Ellipse = W3C_SVG2.Ellipse
}

// MARK: - SVG-Style API

extension W3C_SVG2.Ellipse {
    /// The x-axis coordinate of the center of the ellipse
    ///
    /// SVG attribute: `cx`
    @inlinable
    public var cx: W3C_SVG2.X { center.x }

    /// The y-axis coordinate of the center of the ellipse
    ///
    /// SVG attribute: `cy`
    @inlinable
    public var cy: W3C_SVG2.Y { center.y }

    /// The x-axis radius of the ellipse
    ///
    /// SVG attribute: `rx`
    /// Note: Maps to semiMajor (assumes axis-aligned ellipse with rx as horizontal radius)
    @inlinable
    public var rx: W3C_SVG2.Width { W3C_SVG2.Width(semiMajor.underlying) }

    /// The y-axis radius of the ellipse
    ///
    /// SVG attribute: `ry`
    /// Note: Maps to semiMinor (assumes axis-aligned ellipse with ry as vertical radius)
    @inlinable
    public var ry: W3C_SVG2.Height { W3C_SVG2.Height(semiMinor.underlying) }

    /// Creates an ellipse element using SVG-style parameters
    ///
    /// - Parameters:
    ///   - cx: The x-axis coordinate of the center (default: 0)
    ///   - cy: The y-axis coordinate of the center (default: 0)
    ///   - rx: The x-axis radius (default: 0)
    ///   - ry: The y-axis radius (default: 0)
    @inlinable
    public init(
        cx: W3C_SVG2.X = .init(0),
        cy: W3C_SVG2.Y = .init(0),
        rx: W3C_SVG2.Width = .init(0),
        ry: W3C_SVG2.Height = .init(0)
    ) {
        self.init(
            center: .init(x: cx, y: cy),
            semiMajor: .init(rx.underlying),
            semiMinor: .init(ry.underlying)
        )
    }
}

// MARK: - SVGElementType Conformance

extension W3C_SVG2.Ellipse: SVGElementType {
    /// SVG element tag name
    public static let tagName = "ellipse"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
