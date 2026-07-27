//
//  W3C_SVG2.PaintServers.RadialGradient.swift
//  swift-w3c-svg
//
//  The 'radialGradient' element (SVG 2 Section 14.2.4)
//

extension W3C_SVG2.PaintServers {
    /// The 'radialGradient' element
    ///
    /// W3C SVG 2 Section 14.2.4
    /// https://www.w3.org/TR/SVG2/pservers.html#RadialGradientElement
    ///
    /// Radial gradients create color transitions radiating from a focal point
    /// to an outer circle.
    ///
    /// ## Gradient Geometry
    ///
    /// - **Outer Circle**: Defined by center (cx, cy) and radius (r)
    /// - **Focal Circle**: Defined by center (fx, fy) and radius (fr)
    /// - Color transitions radiate from focal circle to outer circle
    ///
    /// ## New in SVG 2
    ///
    /// The `fr` (focal radius) attribute is new in SVG 2, allowing for more
    /// complex radial gradient effects.
    ///
    /// ## Geometric Consideration
    ///
    /// Rings that are conceptually circular within object bounding box space
    /// will render as elliptical when non-uniform scaling applies.
    ///
    /// ## Usage
    ///
    /// Referenced via URL syntax in fill or stroke properties:
    /// ```
    /// fill="url(#myRadialGradient)"
    /// ```
    ///
    /// ## Example
    ///
    /// ```swift
    /// let gradient = W3C_SVG2.PaintServers.RadialGradient(
    ///     id: "radialGrad",
    ///     cx: "50%",
    ///     cy: "50%",
    ///     r: "50%"
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``LinearGradient``
    /// - ``Stop``
    public struct RadialGradient: SVGElementType, Sendable, Equatable {
        /// Identifier for referencing the gradient
        public let id: String?

        /// X-coordinate of outer circle center
        ///
        /// Default value: 50%
        /// Accepts length or percentage values
        public let cx: String?

        /// Y-coordinate of outer circle center
        ///
        /// Default value: 50%
        /// Accepts length or percentage values
        public let cy: String?

        /// Radius of outer circle
        ///
        /// Default value: 50%
        /// Accepts length or percentage values
        public let r: String?

        /// X-coordinate of focal circle center
        ///
        /// Default value: cx value (if unspecified)
        /// Accepts length or percentage values
        public let fx: String?

        /// Y-coordinate of focal circle center
        ///
        /// Default value: cy value (if unspecified)
        /// Accepts length or percentage values
        public let fy: String?

        /// Radius of focal circle
        ///
        /// Default value: 0%
        /// New in SVG 2
        /// Accepts length or percentage values
        public let fr: String?

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

        /// Creates a radial gradient element
        ///
        /// - Parameters:
        ///   - id: Identifier for referencing (default: nil)
        ///   - cx: Outer circle center x-coordinate (default: nil, uses 50%)
        ///   - cy: Outer circle center y-coordinate (default: nil, uses 50%)
        ///   - r: Outer circle radius (default: nil, uses 50%)
        ///   - fx: Focal circle center x-coordinate (default: nil, uses cx)
        ///   - fy: Focal circle center y-coordinate (default: nil, uses cy)
        ///   - fr: Focal circle radius (default: nil, uses 0%)
        ///   - href: Template gradient reference (default: nil)
        ///   - gradientUnits: Coordinate system (default: nil, uses objectBoundingBox)
        ///   - gradientTransform: Transform for coordinate system (default: nil)
        ///   - spreadMethod: Behavior beyond bounds (default: nil, uses pad)
        public init(
            id: String? = nil,
            cx: String? = nil,
            cy: String? = nil,
            r: String? = nil,
            fx: String? = nil,
            fy: String? = nil,
            fr: String? = nil,
            href: String? = nil,
            gradientUnits: GradientUnits? = nil,
            gradientTransform: String? = nil,
            spreadMethod: SpreadMethod? = nil
        ) {
            self.id = id
            self.cx = cx
            self.cy = cy
            self.r = r
            self.fx = fx
            self.fy = fy
            self.fr = fr
            self.href = href
            self.gradientUnits = gradientUnits
            self.gradientTransform = gradientTransform
            self.spreadMethod = spreadMethod
        }
    }
}

extension W3C_SVG2.PaintServers.RadialGradient {
    /// Coordinate system for gradient geometry
    ///
    /// W3C SVG 2 Section 14.2.4.4
    /// https://www.w3.org/TR/SVG2/pservers.html#RadialGradientElementGradientUnitsAttribute
    public enum GradientUnits: String, Sendable, Equatable {
        /// Coordinate system established by user space
        case userSpaceOnUse

        /// Coordinate system relative to bounding box (0-1 range)
        case objectBoundingBox
    }

    /// Behavior beyond gradient bounds
    ///
    /// W3C SVG 2 Section 14.2.4.6
    /// https://www.w3.org/TR/SVG2/pservers.html#RadialGradientElementSpreadMethodAttribute
    public enum SpreadMethod: String, Sendable, Equatable {
        /// Extend with terminal colors (default)
        case pad

        /// Reflect the gradient pattern
        case reflect

        /// Repeat the gradient pattern
        case `repeat`
    }

    /// SVG element tag name
    public static let tagName = "radialGradient"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
