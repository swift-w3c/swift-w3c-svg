extension W3C_SVG2.Document {

    public struct Defs: SVGElementType, Sendable, Equatable {

        public let id: String?

        public init(
            id: String? = nil
        ) {
            self.id = id
        }
    }
}

extension W3C_SVG2.Document.Defs {

    public static let tagName = "defs"

    public static let isSelfClosing = false
}
