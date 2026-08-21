extension W3C_SVG2.Document {

    public struct Use: SVGElementType, Sendable, Equatable {

        public let href: String?

        public let x: W3C_SVG2.X?

        public let y: W3C_SVG2.Y?

        public let width: W3C_SVG2.Width?

        public let height: W3C_SVG2.Height?

        public init(
            href: String? = nil,
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil
        ) {
            self.href = href
            self.x = x
            self.y = y
            self.width = width
            self.height = height
        }
    }
}

extension W3C_SVG2.Document.Use {

    public static let tagName = "use"

    public static let isSelfClosing = false
}
