//
//  W3C_SVG2.Text.Text.swift
//  swift-w3c-svg
//
//  The 'text' element (SVG 2 Section 11.4)
//

extension W3C_SVG2.Text {
    /// The 'text' element
    ///
    /// W3C SVG 2 Section 11.4
    /// https://www.w3.org/TR/SVG2/text.html#TextElement
    ///
    /// The 'text' element defines a graphics element consisting of text.
    ///
    /// ## Position Attributes
    ///
    /// - **x**: X-coordinate(s) for text positioning
    /// - **y**: Y-coordinate(s) for text positioning
    /// - **dx**: X-axis shift(s) for text positioning
    /// - **dy**: Y-axis shift(s) for text positioning
    ///
    /// ## Content
    ///
    /// - **content**: The text content to render
    ///
    /// ## Example
    ///
    /// ```swift
    /// let text = W3C_SVG2.Text.Text(
    ///     x: 10,
    ///     y: 20,
    ///     content: "Hello SVG"
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``TSpan``
    public struct Text: SVGElementType, Sendable, Equatable {
        /// X-coordinate for text positioning
        public let x: W3C_SVG2.X?

        /// Y-coordinate for text positioning
        public let y: W3C_SVG2.Y?

        /// X-axis shift for text positioning
        public let dx: W3C_SVG2.Dx?

        /// Y-axis shift for text positioning
        public let dy: W3C_SVG2.Dy?

        /// Text content to render
        public let content: String?

        /// Creates a text element
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

extension W3C_SVG2.Text.Text {
    /// Text length adjustment method
    ///
    /// W3C SVG 2 Section 11.7.3
    /// https://www.w3.org/TR/SVG2/text.html#TextElementLengthAdjustAttribute
    public enum LengthAdjust: String, Sendable, Equatable {
        /// Adjust spacing between glyphs
        case spacing

        /// Adjust both spacing and glyph size
        case spacingAndGlyphs
    }

    /// SVG element tag name
    public static let tagName = "text"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
