extension W3C_SVG2.Document {

    public struct Group: SVGElementType, Sendable, Equatable {

        public let id: String?

        public init(
            id: String? = nil
        ) {
            self.id = id
        }
    }
}

extension W3C_SVG2.Document.Group {

    public static let tagName = "g"

    public static let isSelfClosing = false
}
