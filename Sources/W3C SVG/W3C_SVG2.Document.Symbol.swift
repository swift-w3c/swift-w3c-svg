extension W3C_SVG2.Document {

    public struct Symbol: SVGElementType, Sendable, Equatable {

        public let id: String?

        public let x: W3C_SVG2.X?

        public let y: W3C_SVG2.Y?

        public let width: W3C_SVG2.Width?

        public let height: W3C_SVG2.Height?

        public let viewBox: W3C_SVG2.Types.ViewBox?

        public let refX: W3C_SVG2.X?

        public let refY: W3C_SVG2.Y?

        public let preserveAspectRatio: String?

        public init(
            id: String? = nil,
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil,
            viewBox: W3C_SVG2.Types.ViewBox? = nil,
            refX: W3C_SVG2.X? = nil,
            refY: W3C_SVG2.Y? = nil,
            preserveAspectRatio: String? = nil
        ) {
            self.id = id
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.viewBox = viewBox
            self.refX = refX
            self.refY = refY
            self.preserveAspectRatio = preserveAspectRatio
        }
    }
}

extension W3C_SVG2.Document.Symbol {

    public static let tagName = "symbol"

    public static let isSelfClosing = false
}
