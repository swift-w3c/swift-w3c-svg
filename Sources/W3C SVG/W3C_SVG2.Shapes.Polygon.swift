//
//  W3C_SVG2.Shapes.Polygon.swift
//  swift-w3c-svg
//
//  The 'polygon' element (SVG 2 Section 10.7)
//

import Format_Primitives

extension W3C_SVG2.Shapes {
    /// The 'polygon' element
    ///
    /// W3C SVG 2 Section 10.7
    /// https://www.w3.org/TR/SVG2/shapes.html#PolygonElement
    ///
    /// The 'polygon' element defines a closed shape consisting of a set of
    /// connected straight line segments.
    ///
    /// ## Geometry Properties
    ///
    /// - **points**: A list of coordinate pairs defining the polygon path
    ///
    /// ## Geometry Operations
    ///
    /// As a `Geometry.Polygon`, this type provides rich geometric operations:
    /// - `area` - The area of the polygon (signed for winding direction)
    /// - `perimeter` - The total length of all edges
    /// - `centroid` - The geometric center
    /// - `contains(_:)` - Check if a point is inside the polygon
    /// - `isConvex` - Whether the polygon is convex
    /// - `boundingBox` - Axis-aligned bounding rectangle
    /// - `translated(by:)`, `scaled(by:)` - Transformations
    ///
    /// ## Behavior
    ///
    /// Unlike polylines, polygons automatically close by performing a closepath
    /// command after connecting all vertices, creating a sealed geometric form.
    ///
    /// ## Example
    ///
    /// ```swift
    /// // Triangle
    /// let triangle = W3C_SVG2.Shapes.Polygon(coordinates: [
    ///     (.init(50), .init(0)),
    ///     (.init(100), .init(100)),
    ///     (.init(0), .init(100))
    /// ])
    ///
    /// // Geometry operations
    /// let area = triangle.area
    /// let isConvex = triangle.isConvex
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Polyline``
    /// - ``Line``
    public typealias Polygon = W3C_SVG2.Polygon
}

// MARK: - SVG-Style API

extension W3C_SVG2.Polygon {
    /// The points string for SVG output
    ///
    /// SVG attribute: `points`
    /// Format: space-separated list of "x,y" coordinate pairs
    public var points: String {
        vertices.map {
            "\($0.x.formatted(.number)),\($0.y.formatted(.number))"
        }.joined(separator: " ")
    }

    /// Creates a polygon element from coordinate tuples
    ///
    /// - Parameters:
    ///   - coordinates: Array of (x, y) coordinate tuples
    public init(coordinates: [(W3C_SVG2.X, W3C_SVG2.Y)]) {
        self.init(vertices: coordinates.map { .init(x: $0.0, y: $0.1) })
    }
}

// MARK: - SVGElementType Conformance

extension W3C_SVG2.Polygon: SVGElementType {
    /// SVG element tag name
    public static let tagName = "polygon"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
