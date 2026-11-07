extension W3C_SVG2.Painting {

    public struct ClipPath: SVGElementType, Sendable, Equatable {

        public let id: String?

        public let clipPathUnits: Units?

        public init(
            id: String? = nil,
            clipPathUnits: Units? = nil
        ) {
            self.id = id
            self.clipPathUnits = clipPathUnits
        }
    }
}

extension W3C_SVG2.Painting.ClipPath {


    public static let tagName = "clipPath"

    public static let isSelfClosing = false
}
