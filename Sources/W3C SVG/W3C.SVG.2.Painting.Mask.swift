public import W3C

extension W3C.SVG.`2`.Painting {

    public struct Mask: SVGElementType, Sendable, Equatable {

        public let id: String?

        public let x: W3C.SVG.`2`.X?

        public let y: W3C.SVG.`2`.Y?

        public let width: W3C.SVG.`2`.Width?

        public let height: W3C.SVG.`2`.Height?

        public let maskUnits: Units?

        public let maskContentUnits: Units?

        public init(
            id: String? = nil,
            x: W3C.SVG.`2`.X? = nil,
            y: W3C.SVG.`2`.Y? = nil,
            width: W3C.SVG.`2`.Width? = nil,
            height: W3C.SVG.`2`.Height? = nil,
            maskUnits: Units? = nil,
            maskContentUnits: Units? = nil
        ) {
            self.id = id
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.maskUnits = maskUnits
            self.maskContentUnits = maskContentUnits
        }
    }
}

extension W3C.SVG.`2`.Painting.Mask {

    public static let tagName = "mask"

    public static let isSelfClosing = false
}
