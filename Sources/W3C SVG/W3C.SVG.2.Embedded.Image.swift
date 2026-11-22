public import RFC_3987
public import W3C

extension W3C.SVG.`2`.Embedded {

    public struct Image: SVGElementType, Sendable, Equatable {

        public let x: W3C.SVG.`2`.X?

        public let y: W3C.SVG.`2`.Y?

        public let width: W3C.SVG.`2`.Width?

        public let height: W3C.SVG.`2`.Height?

        public let href: IETF.RFC.`3987`.IRI.Reference?

        public let preserveAspectRatio: String?

        public init(
            x: W3C.SVG.`2`.X? = nil,
            y: W3C.SVG.`2`.Y? = nil,
            width: W3C.SVG.`2`.Width? = nil,
            height: W3C.SVG.`2`.Height? = nil,
            href: IETF.RFC.`3987`.IRI.Reference? = nil,
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

extension W3C.SVG.`2`.Embedded.Image {

    public static let tagName = "image"

    public static let isSelfClosing = false
}
