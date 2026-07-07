//
//  W3C_SVG2.Painting.Marker.swift
//  swift-w3c-svg
//
//  The 'marker' element (SVG 2 Section 13.6)
//

extension W3C_SVG2.Painting {
    /// The 'marker' element
    ///
    /// W3C SVG 2 Section 13.6
    /// https://www.w3.org/TR/SVG2/painting.html#MarkerElement
    ///
    /// The 'marker' element defines a graphic to be used for drawing symbols
    /// at vertices of paths, lines, polylines, and polygons.
    ///
    /// ## Reference Point
    ///
    /// - **refX**: X-coordinate of marker reference point
    /// - **refY**: Y-coordinate of marker reference point
    ///
    /// ## Marker Size
    ///
    /// - **markerWidth**: Width of marker viewport (default: 3)
    /// - **markerHeight**: Height of marker viewport (default: 3)
    ///
    /// ## Orientation
    ///
    /// - **orient**: Orientation of marker (angle or "auto"/"auto-start-reverse")
    ///
    /// ## Example
    ///
    /// ```swift
    /// let marker = W3C_SVG2.Painting.Marker(
    ///     id: "arrow",
    ///     viewBox: W3C_SVG2.Types.ViewBox(width: 10, height: 10),
    ///     refX: 5,
    ///     refY: 5,
    ///     markerWidth: 6,
    ///     markerHeight: 6,
    ///     orient: "auto"
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``W3C_SVG2.Paths``
    public struct Marker: SVGElementType, Sendable, Equatable {
        /// Identifier for referencing the marker
        public let id: String?

        /// ViewBox for marker content
        public let viewBox: W3C_SVG2.Types.ViewBox?

        /// X-coordinate of marker reference point
        ///
        /// Default value: 0
        public let refX: W3C_SVG2.X?

        /// Y-coordinate of marker reference point
        ///
        /// Default value: 0
        public let refY: W3C_SVG2.Y?

        /// Width of marker viewport
        ///
        /// Default value: 3
        public let markerWidth: W3C_SVG2.Width?

        /// Height of marker viewport
        ///
        /// Default value: 3
        public let markerHeight: W3C_SVG2.Height?

        /// Orientation of marker
        ///
        /// Can be a number (degrees) or "auto" or "auto-start-reverse"
        public let orient: String?

        /// Coordinate system for markerWidth and markerHeight
        ///
        /// Default value: strokeWidth
        public let markerUnits: Units?

        /// Controls aspect ratio preservation
        public let preserveAspectRatio: String?

        /// Creates a marker element
        ///
        /// - Parameters:
        ///   - id: Identifier for referencing (default: nil)
        ///   - viewBox: ViewBox for marker content (default: nil)
        ///   - refX: Reference point x-coordinate (default: nil, uses 0)
        ///   - refY: Reference point y-coordinate (default: nil, uses 0)
        ///   - markerWidth: Width of marker viewport (default: nil, uses 3)
        ///   - markerHeight: Height of marker viewport (default: nil, uses 3)
        ///   - orient: Orientation (default: nil)
        ///   - markerUnits: Coordinate system (default: nil, uses strokeWidth)
        ///   - preserveAspectRatio: Aspect ratio control (default: nil)
        public init(
            id: String? = nil,
            viewBox: W3C_SVG2.Types.ViewBox? = nil,
            refX: W3C_SVG2.X? = nil,
            refY: W3C_SVG2.Y? = nil,
            markerWidth: W3C_SVG2.Width? = nil,
            markerHeight: W3C_SVG2.Height? = nil,
            orient: String? = nil,
            markerUnits: Units? = nil,
            preserveAspectRatio: String? = nil
        ) {
            self.id = id
            self.viewBox = viewBox
            self.refX = refX
            self.refY = refY
            self.markerWidth = markerWidth
            self.markerHeight = markerHeight
            self.orient = orient
            self.markerUnits = markerUnits
            self.preserveAspectRatio = preserveAspectRatio
        }
    }
}

extension W3C_SVG2.Painting.Marker {
    /// Coordinate system for markerWidth and markerHeight
    ///
    /// W3C SVG 2 Section 13.6.2
    /// https://www.w3.org/TR/SVG2/painting.html#MarkerUnitsAttribute
    public enum Units: String, Sendable, Equatable {
        /// Marker size relative to stroke width
        case strokeWidth

        /// Marker size in user space units
        case userSpaceOnUse
    }

    /// SVG element tag name
    public static let tagName = "marker"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
