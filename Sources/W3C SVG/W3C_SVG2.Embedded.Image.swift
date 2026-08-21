extension W3C_SVG2.Embedded {

    public struct Image: SVGElementType, Sendable, Equatable {

        public let x: W3C_SVG2.X?

        public let y: W3C_SVG2.Y?

        public let width: W3C_SVG2.Width?

        public let height: W3C_SVG2.Height?

        public let href: String?

        public let preserveAspectRatio: String?

        public init(
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil,
            href: String? = nil,
            preserveAspectRatio: String? = nil
        ) {
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.href = href
            self.preserveAspectRatio = preserveAspectRatio
        }
    }
}

extension W3C_SVG2.Embedded.Image {

    public static let tagName = "image"

    public static let isSelfClosing = false
}
