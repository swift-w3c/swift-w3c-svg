//
//  W3C_SVG2.PaintServers.LinearGradient.swift
//  swift-w3c-svg
//
//  The 'linearGradient' element (SVG 2 Section 14.2.3)
//

extension W3C_SVG2.PaintServers {
    /// The 'linearGradient' element
    ///
    /// W3C SVG 2 Section 14.2.3
    /// https://www.w3.org/TR/SVG2/pservers.html#LinearGradientElement
    ///
    /// Linear gradients define smooth color transitions along a vector line.
    ///
    /// ## Gradient Vector
    ///
    /// The gradient vector is defined by start point (x1, y1) and end point (x2, y2).
    /// When start and end points coincide, the area fills with the terminal stop color.
    ///
    /// ## Key Attributes
    ///
    /// - **x1, y1**: Start point of gradient vector (default: 0%, 0%)
    /// - **x2, y2**: End point of gradient vector (default: 100%, 0%)
    /// - **gradientUnits**: Coordinate system mode (userSpaceOnUse or objectBoundingBox)
    /// - **spreadMethod**: Behavior beyond gradient bounds (pad, reflect, repeat)
    ///
    /// ## Usage
    ///
    /// Referenced via URL syntax in fill or stroke properties:
    /// ```
    /// fill="url(#myGradient)"
    /// ```
    ///
    /// ## Example
    ///
    /// ```swift
    /// let gradient = W3C_SVG2.PaintServers.LinearGradient(
    ///     id: "myGradient",
    ///     x1: "0%",
    ///     y1: "0%",
    ///     x2: "100%",
    ///     y2: "100%"
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``RadialGradient``
    /// - ``Stop``
    public struct LinearGradient: SVGElementType, Sendable, Equatable {
        /// Identifier for referencing the gradient
        public let id: String?

        /// X-coordinate of gradient vector start point
        ///
        /// Default value: 0%
        /// Accepts length or percentage values
        public let x1: String?

        /// Y-coordinate of gradient vector start point
        ///
        /// Default value: 0%
        /// Accepts length or percentage values
        public let y1: String?

        /// X-coordinate of gradient vector end point
        ///
        /// Default value: 100%
        /// Accepts length or percentage values
        public let x2: String?

        /// Y-coordinate of gradient vector end point
        ///
        /// Default value: 0%
        /// Accepts length or percentage values
        public let y2: String?

        /// Reference to template gradient element
        ///
        /// Format: "#elementId" or URL
        public let href: String?

        /// Coordinate system for gradient geometry
        ///
        /// Default value: objectBoundingBox
        public let gradientUnits: GradientUnits?

        /// Transform applied to gradient coordinate system
        public let gradientTransform: String?

        /// Behavior beyond gradient bounds
        ///
        /// Default value: pad
        public let spreadMethod: SpreadMethod?

        /// Creates a linear gradient element
        ///
        /// - Parameters:
        ///   - id: Identifier for referencing (default: nil)
        ///   - x1: Start point x-coordinate (default: nil, uses 0%)
        ///   - y1: Start point y-coordinate (default: nil, uses 0%)
        ///   - x2: End point x-coordinate (default: nil, uses 100%)
        ///   - y2: End point y-coordinate (default: nil, uses 0%)
        ///   - href: Template gradient reference (default: nil)
        ///   - gradientUnits: Coordinate system (default: nil, uses objectBoundingBox)
        ///   - gradientTransform: Transform for coordinate system (default: nil)
        ///   - spreadMethod: Behavior beyond bounds (default: nil, uses pad)
        public init(
            id: String? = nil,
            x1: String? = nil,
            y1: String? = nil,
            x2: String? = nil,
            y2: String? = nil,
            href: String? = nil,
            gradientUnits: GradientUnits? = nil,
            gradientTransform: String? = nil,
            spreadMethod: SpreadMethod? = nil
        ) {
            self.id = id
            self.x1 = x1
            self.y1 = y1
            self.x2 = x2
            self.y2 = y2
            self.href = href
            self.gradientUnits = gradientUnits
            self.gradientTransform = gradientTransform
            self.spreadMethod = spreadMethod
        }
    }
}

extension W3C_SVG2.PaintServers.LinearGradient {
    /// Coordinate system for gradient geometry
    ///
    /// W3C SVG 2 Section 14.2.3.4
    /// https://www.w3.org/TR/SVG2/pservers.html#LinearGradientElementGradientUnitsAttribute
    public enum GradientUnits: String, Sendable, Equatable {
        /// Coordinate system established by user space
        case userSpaceOnUse

        /// Coordinate system relative to bounding box (0-1 range)
        case objectBoundingBox
    }

    /// Behavior beyond gradient bounds
    ///
    /// W3C SVG 2 Section 14.2.3.6
    /// https://www.w3.org/TR/SVG2/pservers.html#LinearGradientElementSpreadMethodAttribute
    public enum SpreadMethod: String, Sendable, Equatable {
        /// Extend with terminal colors (default)
        case pad

        /// Reflect the gradient pattern
        case reflect

        /// Repeat the gradient pattern
        case `repeat`
    }

    /// SVG element tag name
    public static let tagName = "linearGradient"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
