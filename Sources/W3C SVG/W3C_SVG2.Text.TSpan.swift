//
//  W3C_SVG2.Text.TSpan.swift
//  swift-w3c-svg
//
//  The 'tspan' element (SVG 2 Section 11.4.2)
//

extension W3C_SVG2.Text {
    /// The 'tspan' element
    ///
    /// W3C SVG 2 Section 11.4.2
    /// https://www.w3.org/TR/SVG2/text.html#TSpanElement
    ///
    /// The 'tspan' element defines a sub-text within a 'text' element.
    /// It can be used to adjust positioning and styling for portions of text.
    ///
    /// ## Position Attributes
    ///
    /// - **x**: X-coordinate(s) for positioning
    /// - **y**: Y-coordinate(s) for positioning
    /// - **dx**: X-axis shift(s) relative to current position
    /// - **dy**: Y-axis shift(s) relative to current position
    ///
    /// ## Content
    ///
    /// - **content**: The text content to render within the span
    ///
    /// ## Example
    ///
    /// ```swift
    /// let tspan = W3C_SVG2.Text.TSpan(
    ///     dx: 5,
    ///     dy: 10,
    ///     content: "styled text"
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Text``
    public struct TSpan: SVGElementType, Sendable, Equatable {
        /// X-coordinate for positioning
        public let x: W3C_SVG2.X?

        /// Y-coordinate for positioning
        public let y: W3C_SVG2.Y?

        /// X-axis shift relative to current position
        public let dx: W3C_SVG2.Dx?

        /// Y-axis shift relative to current position
        public let dy: W3C_SVG2.Dy?

        /// Text content to render
        public let content: String?

        /// Creates a tspan element
        ///
        /// - Parameters:
        ///   - x: X-coordinate (default: nil)
        ///   - y: Y-coordinate (default: nil)
        ///   - dx: X-axis shift (default: nil)
        ///   - dy: Y-axis shift (default: nil)
        ///   - content: Text content (default: nil)
        public init(
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            dx: W3C_SVG2.Dx? = nil,
            dy: W3C_SVG2.Dy? = nil,
            content: String? = nil
        ) {
            self.x = x
            self.y = y
            self.dx = dx
            self.dy = dy
            self.content = content
        }
    }
}

extension W3C_SVG2.Text.TSpan {
    /// SVG element tag name
    public static let tagName = "tspan"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
