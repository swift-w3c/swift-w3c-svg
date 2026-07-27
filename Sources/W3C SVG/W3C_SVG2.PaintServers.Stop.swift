//
//  W3C_SVG2.PaintServers.Stop.swift
//  swift-w3c-svg
//
//  The 'stop' element (SVG 2 Section 14.2.2)
//

extension W3C_SVG2.PaintServers {
    /// The 'stop' element
    ///
    /// W3C SVG 2 Section 14.2.2
    /// https://www.w3.org/TR/SVG2/pservers.html#GradientStops
    ///
    /// Gradient stops define color positions within linear and radial gradients.
    ///
    /// ## Position Attribute
    ///
    /// - **offset**: Position along gradient vector (0–1 or 0%–100%)
    ///
    /// ## Color Properties
    ///
    /// - **stop-color**: Color at this position (initial: black)
    /// - **stop-opacity**: Opacity multiplier (initial: 1)
    ///
    /// ## Ordering Rules
    ///
    /// Offsets automatically adjust if out of ascending order.
    /// Minimum two stops required for gradient effect.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let stop1 = W3C_SVG2.PaintServers.Stop(offset: "0%")
    /// let stop2 = W3C_SVG2.PaintServers.Stop(offset: "100%")
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``LinearGradient``
    /// - ``RadialGradient``
    public struct Stop: SVGElementType, Sendable, Equatable {
        /// Position along gradient vector
        ///
        /// Format: number (0–1) or percentage (0%–100%)
        /// Example: "0%", "50%", "1.0", "0.5"
        ///
        /// Offsets automatically adjust if out of ascending order
        public let offset: String?

        /// Color at this stop position
        ///
        /// Default value: black
        /// Accepts color values (name, hex, rgb, etc.)
        public let stopColor: String?

        /// Opacity multiplier for the stop color
        ///
        /// Default value: 1.0
        /// Range: 0.0 (transparent) to 1.0 (opaque)
        public let stopOpacity: Double?

        /// Creates a stop element
        ///
        /// - Parameters:
        ///   - offset: Position along gradient vector (default: nil)
        ///   - stopColor: Color at this position (default: nil, uses black)
        ///   - stopOpacity: Opacity multiplier (default: nil, uses 1.0)
        public init(
            offset: String? = nil,
            stopColor: String? = nil,
            stopOpacity: Double? = nil
        ) {
            self.offset = offset
            self.stopColor = stopColor
            self.stopOpacity = stopOpacity
        }
    }
}

extension W3C_SVG2.PaintServers.Stop {
    /// SVG element tag name
    public static let tagName = "stop"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
