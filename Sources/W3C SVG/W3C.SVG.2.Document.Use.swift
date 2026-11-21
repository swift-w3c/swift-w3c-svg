public import RFC_3987
public import W3C

extension W3C.SVG.`2`.Document {

    public struct Use: SVGElementType, Sendable, Equatable {

        public let href: RFC_3987.IRI.Reference?

        public let x: W3C.SVG.`2`.X?

        public let y: W3C.SVG.`2`.Y?

        public let width: W3C.SVG.`2`.Width?

        public let height: W3C.SVG.`2`.Height?

        public init(
            href: RFC_3987.IRI.Reference? = nil,
            x: W3C.SVG.`2`.X? = nil,
            y: W3C.SVG.`2`.Y? = nil,
            width: W3C.SVG.`2`.Width? = nil,
            height: W3C.SVG.`2`.Height? = nil
        ) {
            self.href = href
            self.x = x
            self.y = y
            self.width = width
            self.height = height
        }
    }
}

extension W3C.SVG.`2`.Document.Use {

    public static let tagName = "use"

    public static let isSelfClosing = false
}
