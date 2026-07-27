//
//  W3C_SVG2.PaintServers.Pattern.swift
//  swift-w3c-svg
//
//  The 'pattern' element (SVG 2 Section 14.3)
//

extension W3C_SVG2.PaintServers {
    /// The 'pattern' element
    ///
    /// W3C SVG 2 Section 14.3
    /// https://www.w3.org/TR/SVG2/pservers.html#Patterns
    ///
    /// Patterns tile a graphic element to fill or stroke areas.
    ///
    /// ## Tile Geometry
    ///
    /// - **x, y**: Reference rectangle origin (default: 0)
    /// - **width, height**: Tile dimensions (default: 0; zero disables rendering)
    ///
    /// ## Coordinate Systems
    ///
    /// - **patternUnits**: For x, y, width, height (userSpaceOnUse or objectBoundingBox)
    /// - **patternContentUnits**: For pattern contents (default: userSpaceOnUse)
    ///
    /// ## Clipping Behavior
    ///
    /// The user agent stylesheet sets `overflow: hidden`, clipping pattern
    /// content to tile boundaries unless overridden.
    ///
    /// ## Usage
    ///
    /// Referenced via URL syntax in fill or stroke properties:
    /// ```
    /// fill="url(#myPattern)"
    /// ```
    ///
    /// ## Example
    ///
    /// ```swift
    /// let pattern = W3C_SVG2.PaintServers.Pattern(
    ///     id: "dots",
    ///     x: 0,
    ///     y: 0,
    ///     width: 10,
    ///     height: 10
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``LinearGradient``
    /// - ``RadialGradient``
    public struct Pattern: SVGElementType, Sendable, Equatable {
        /// Identifier for referencing the pattern
        public let id: String?

        /// X-coordinate of reference rectangle origin
        ///
        /// Default value: 0
        public let x: W3C_SVG2.X?

        /// Y-coordinate of reference rectangle origin
        ///
        /// Default value: 0
        public let y: W3C_SVG2.Y?

        /// Tile width
        ///
        /// Default value: 0 (zero disables rendering)
        public let width: W3C_SVG2.Width?

        /// Tile height
        ///
        /// Default value: 0 (zero disables rendering)
        public let height: W3C_SVG2.Height?

        /// The viewBox defining the coordinate system for pattern content
        public let viewBox: W3C_SVG2.Types.ViewBox?

        /// Reference to template pattern element
        ///
        /// Format: "#elementId" or URL
        public let href: String?

        /// Coordinate system for pattern geometry (x, y, width, height)
        ///
        /// Default value: objectBoundingBox
        public let patternUnits: Units?

        /// Coordinate system for pattern contents
        ///
        /// Default value: userSpaceOnUse
        public let patternContentUnits: Units?

        /// Transform to apply to pattern coordinate system
        public let patternTransform: String?

        /// Controls aspect ratio preservation
        public let preserveAspectRatio: String?

        /// Creates a pattern element
        ///
        /// - Parameters:
        ///   - id: Identifier for referencing (default: nil)
        ///   - x: Reference rectangle origin x (default: nil, uses 0)
        ///   - y: Reference rectangle origin y (default: nil, uses 0)
        ///   - width: Tile width (default: nil, uses 0)
        ///   - height: Tile height (default: nil, uses 0)
        ///   - viewBox: ViewBox coordinate system (default: nil)
        ///   - href: Template pattern reference (default: nil)
        ///   - patternUnits: Coordinate system for geometry (default: nil, uses objectBoundingBox)
        ///   - patternContentUnits: Coordinate system for content (default: nil, uses userSpaceOnUse)
        ///   - patternTransform: Transform for coordinate system (default: nil)
        ///   - preserveAspectRatio: Aspect ratio control (default: nil)
        public init(
            id: String? = nil,
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil,
            viewBox: W3C_SVG2.Types.ViewBox? = nil,
            href: String? = nil,
            patternUnits: Units? = nil,
            patternContentUnits: Units? = nil,
            patternTransform: String? = nil,
            preserveAspectRatio: String? = nil
        ) {
            self.id = id
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.viewBox = viewBox
            self.href = href
            self.patternUnits = patternUnits
            self.patternContentUnits = patternContentUnits
            self.patternTransform = patternTransform
            self.preserveAspectRatio = preserveAspectRatio
        }
    }
}

extension W3C_SVG2.PaintServers.Pattern {
    /// Coordinate system for pattern geometry
    ///
    /// W3C SVG 2 Section 14.3.2
    /// https://www.w3.org/TR/SVG2/pservers.html#PatternElementPatternUnitsAttribute
    public enum Units: String, Sendable, Equatable {
        /// Coordinate system established by user space
        case userSpaceOnUse

        /// Coordinate system relative to bounding box (0-1 range)
        case objectBoundingBox
    }

    /// SVG element tag name
    public static let tagName = "pattern"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
