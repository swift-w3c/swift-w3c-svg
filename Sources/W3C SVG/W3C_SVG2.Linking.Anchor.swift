extension W3C_SVG2.Linking {

    public struct Anchor: SVGElementType, Sendable, Equatable {

        public let href: String?

        public let target: String?

        public let download: String?

        public let ping: String?

        public let rel: String?

        public let hreflang: String?

        public let type: String?

        public let referrerpolicy: String?

        public init(
            href: String? = nil,
            target: String? = nil,
            download: String? = nil,
            ping: String? = nil,
            rel: String? = nil,
            hreflang: String? = nil,
            type: String? = nil,
            referrerpolicy: String? = nil
        ) {
            self.href = href
            self.target = target
            self.download = download
            self.ping = ping
            self.rel = rel
            self.hreflang = hreflang
            self.type = type
            self.referrerpolicy = referrerpolicy
        }
    }
}

extension W3C_SVG2.Linking.Anchor {

    public static let tagName = "a"

    public static let isSelfClosing = false
}
