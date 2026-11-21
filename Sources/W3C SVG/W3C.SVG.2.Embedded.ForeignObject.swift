public import W3C

extension W3C.SVG.`2`.Embedded {

    public struct ForeignObject: SVGElementType, Sendable, Equatable {

        public let x: W3C.SVG.`2`.X?

        public let y: W3C.SVG.`2`.Y?

        public let width: W3C.SVG.`2`.Width?

        public let height: W3C.SVG.`2`.Height?

        public init(
            x: W3C.SVG.`2`.X? = nil,
            y: W3C.SVG.`2`.Y? = nil,
            width: W3C.SVG.`2`.Width? = nil,
            height: W3C.SVG.`2`.Height? = nil
        ) {
            self.x = x
            self.y = y
            self.width = width
            self.height = height
        }
    }
}

extension W3C.SVG.`2`.Embedded.ForeignObject {

    public static let tagName = "foreignObject"

    public static let isSelfClosing = false
}
