//
//  W3C_SVG2.Document.SVG.swift
//  swift-w3c-svg
//
//  The 'svg' root element (SVG 2 Section 5.1.2)
//

extension W3C_SVG2.Document {
    /// The 'svg' root element
    ///
    /// W3C SVG 2 Section 5.1.2
    /// https://www.w3.org/TR/SVG2/struct.html#SVGElement
    ///
    /// The 'svg' element defines an SVG document fragment and establishes a viewport.
    /// It is a container element, renderable element, and structural element.
    ///
    /// ## Geometry Properties
    ///
    /// - **x**: Position for embedded svg elements (default: 0, no effect on outermost svg)
    /// - **y**: Position for embedded svg elements (default: 0, no effect on outermost svg)
    /// - **width**: Intrinsic width or viewport width for embedded elements
    /// - **height**: Intrinsic height or viewport height for embedded elements
    ///
    /// ## Viewport Properties
    ///
    /// - **viewBox**: Defines the coordinate system for the SVG viewport
    /// - **preserveAspectRatio**: Controls aspect ratio scaling behavior
    ///
    /// ## Example
    ///
    /// ```swift
    /// let svg = W3C_SVG2.Document.SVG(
    ///     viewBox: W3C_SVG2.Types.ViewBox(width: 100, height: 100),
    ///     width: 100,
    ///     height: 100
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Group``
    /// - ``Symbol``
    public struct SVG: SVGElementType, Sendable, Equatable {
        /// The x-axis coordinate for embedded svg elements
        ///
        /// Default value: 0
        /// Note: Has no effect on outermost svg element
        public let x: W3C_SVG2.Types.Length?

        /// The y-axis coordinate for embedded svg elements
        ///
        /// Default value: 0
        /// Note: Has no effect on outermost svg element
        public let y: W3C_SVG2.Types.Length?

        /// The intrinsic width or viewport width
        public let width: W3C_SVG2.Types.Length?

        /// The intrinsic height or viewport height
        public let height: W3C_SVG2.Types.Length?

        /// The viewBox defining the coordinate system
        public let viewBox: W3C_SVG2.Types.ViewBox?

        /// Creates an svg element
        ///
        /// - Parameters:
        ///   - x: The x-coordinate for embedded svg (default: nil, uses 0)
        ///   - y: The y-coordinate for embedded svg (default: nil, uses 0)
        ///   - width: The width (default: nil)
        ///   - height: The height (default: nil)
        ///   - viewBox: The viewBox coordinate system (default: nil)
        public init(
            x: W3C_SVG2.Types.Length? = nil,
            y: W3C_SVG2.Types.Length? = nil,
            width: W3C_SVG2.Types.Length? = nil,
            height: W3C_SVG2.Types.Length? = nil,
            viewBox: W3C_SVG2.Types.ViewBox? = nil
        ) {
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.viewBox = viewBox
        }
    }
}

extension W3C_SVG2.Document.SVG {
    /// SVG element tag name
    public static let tagName = "svg"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
