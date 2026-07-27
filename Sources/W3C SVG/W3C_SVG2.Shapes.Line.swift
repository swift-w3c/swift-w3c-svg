//
//  W3C_SVG2.Shapes.Line.swift
//  swift-w3c-svg
//
//  The 'line' element (SVG 2 Section 10.5)
//

extension W3C_SVG2.Shapes {
    /// The 'line' element
    ///
    /// W3C SVG 2 Section 10.5
    /// https://www.w3.org/TR/SVG2/shapes.html#LineElement
    ///
    /// The 'line' element defines a line segment that starts at one point and ends at another.
    ///
    /// ## Geometry Properties
    ///
    /// - **x1**: The x-coordinate of the start point (default: 0)
    /// - **y1**: The y-coordinate of the start point (default: 0)
    /// - **x2**: The x-coordinate of the end point (default: 0)
    /// - **y2**: The y-coordinate of the end point (default: 0)
    ///
    /// ## Geometry Operations
    ///
    /// As a `Geometry.Line.Segment`, this type provides geometric operations:
    /// - `length` - The length of the line segment
    /// - `midpoint` - The midpoint of the segment
    /// - `direction` - Unit vector in the direction of the line
    /// - `translated(by:)` - Translation
    ///
    /// ## Example
    ///
    /// ```swift
    /// let line = W3C_SVG2.Shapes.Line(x1: 0, y1: 0, x2: 100, y2: 100)
    ///
    /// // Geometry operations
    /// let len = line.length
    /// let mid = line.midpoint
    /// ```
    public typealias Line = W3C_SVG2.Line
}

// MARK: - SVG-Style API

extension W3C_SVG2.Line {
    /// The x-coordinate of the start point
    ///
    /// SVG attribute: `x1`
    @inlinable
    public var x1: W3C_SVG2.X { start.x }

    /// The y-coordinate of the start point
    ///
    /// SVG attribute: `y1`
    @inlinable
    public var y1: W3C_SVG2.Y { start.y }

    /// The x-coordinate of the end point
    ///
    /// SVG attribute: `x2`
    @inlinable
    public var x2: W3C_SVG2.X { end.x }

    /// The y-coordinate of the end point
    ///
    /// SVG attribute: `y2`
    @inlinable
    public var y2: W3C_SVG2.Y { end.y }

    /// Creates a line element using SVG-style parameters
    ///
    /// - Parameters:
    ///   - x1: The x-coordinate of the start point (default: 0)
    ///   - y1: The y-coordinate of the start point (default: 0)
    ///   - x2: The x-coordinate of the end point (default: 0)
    ///   - y2: The y-coordinate of the end point (default: 0)
    @inlinable
    public init(
        x1: W3C_SVG2.X = .init(0),
        y1: W3C_SVG2.Y = .init(0),
        x2: W3C_SVG2.X = .init(0),
        y2: W3C_SVG2.Y = .init(0)
    ) {
        self.init(
            start: .init(x: x1, y: y1),
            end: .init(x: x2, y: y2)
        )
    }
}

// MARK: - SVGElementType Conformance

extension W3C_SVG2.Line: SVGElementType {
    /// SVG element tag name
    public static let tagName = "line"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
