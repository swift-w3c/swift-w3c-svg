extension W3C_SVG2.Document {

    public struct SVG: SVGElementType, Sendable, Equatable {

        public let x: W3C_SVG2.Types.Length?

        public let y: W3C_SVG2.Types.Length?

        public let width: W3C_SVG2.Types.Length?

        public let height: W3C_SVG2.Types.Length?

        public let viewBox: W3C_SVG2.Types.ViewBox?

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

    public static let tagName = "svg"

    public static let isSelfClosing = false
}
