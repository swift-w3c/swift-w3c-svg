public import W3C

extension W3C.SVG.`2`.Paint {

    public struct Stop: SVGElementType, Sendable, Equatable {

        public let offset: String?

        public let stopColor: String?

        public let stopOpacity: Double?

        public init(
            offset: String? = nil,
            stopColor: String? = nil,
            stopOpacity: Double? = nil
        ) {
            self.offset = offset
            self.stopColor = stopColor
            self.stopOpacity = stopOpacity
        }
    }
}

extension W3C.SVG.`2`.Paint.Stop {

    public static let tagName = "stop"

    public static let isSelfClosing = false
}
