//
//  W3C_SVG2.Shapes.Polyline.swift
//  swift-w3c-svg
//
//  The 'polyline' element (SVG 2 Section 10.6)
//

import Format_Primitives

extension W3C_SVG2.Shapes {
    /// The 'polyline' element
    ///
    /// W3C SVG 2 Section 10.6
    /// https://www.w3.org/TR/SVG2/shapes.html#PolylineElement
    ///
    /// The 'polyline' element defines a set of connected straight line segments.
    /// Typically, 'polyline' elements define open shapes.
    ///
    /// ## Geometry Properties
    ///
    /// - **points**: A list of coordinate pairs defining the polyline path
    ///
    /// ## Behavior
    ///
    /// Polylines render as a series of connected lines without automatic closure.
    /// If an odd number of coordinates is supplied, the final coordinate is dropped.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let polyline = W3C_SVG2.Shapes.Polyline(points: "0,0 50,50 100,0")
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Polygon``
    /// - ``Line``
    public struct Polyline: SVGElementType, Sendable, Equatable {
        /// A list of coordinate pairs defining the polyline path
        ///
        /// Format: space or comma-separated list of coordinate pairs (x,y)
        /// Example: "0,0 50,50 100,0" or "0 0 50 50 100 0"
        public let points: String?

        /// Creates a polyline element
        ///
        /// - Parameters:
        ///   - points: A list of coordinate pairs (default: nil)
        public init(
            points: String? = nil
        ) {
            self.points = points
        }

        /// Creates a polyline element from coordinate tuples
        ///
        /// - Parameters:
        ///   - coordinates: Array of (x, y) coordinate tuples
        public init(coordinates: [(W3C_SVG2.X, W3C_SVG2.Y)]) {
            self.points = coordinates.map {
                "\($0.0.formatted(.number)),\($0.1.formatted(.number))"
            }.joined(separator: " ")
        }

        /// SVG element tag name
        public static let tagName = "polyline"

        /// Whether this element is self-closing
        public static let isSelfClosing = false
    }
}
