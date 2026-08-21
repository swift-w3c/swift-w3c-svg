extension W3C_SVG2.Text {

    public struct Text: SVGElementType, Sendable, Equatable {

        public let x: W3C_SVG2.X?

        public let y: W3C_SVG2.Y?

        public let dx: W3C_SVG2.Dx?

        public let dy: W3C_SVG2.Dy?

        public let content: String?

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

    public enum LengthAdjust: String, Sendable, Equatable {

        case spacing

        case spacingAndGlyphs
    }

    public static let tagName = "text"

    public static let isSelfClosing = false
}
