public import W3C

extension W3C.SVG.`2`.Text {

    public struct Text: SVGElementType, Sendable, Equatable {

        public let x: W3C.SVG.`2`.X?

        public let y: W3C.SVG.`2`.Y?

        public let dx: W3C.SVG.`2`.Dx?

        public let dy: W3C.SVG.`2`.Dy?

        public let content: String?

        public init(
            x: W3C.SVG.`2`.X? = nil,
            y: W3C.SVG.`2`.Y? = nil,
            dx: W3C.SVG.`2`.Dx? = nil,
            dy: W3C.SVG.`2`.Dy? = nil,
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

extension W3C.SVG.`2`.Text.Text {

    public static let tagName = "text"

    public static let isSelfClosing = false
}
