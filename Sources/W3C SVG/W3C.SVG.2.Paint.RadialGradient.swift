public import RFC_3987
public import W3C

extension W3C.SVG.`2`.Paint {

    public struct RadialGradient: SVGElementType, Sendable, Equatable {

        public let id: String?

        public let cx: String?

        public let cy: String?

        public let r: String?

        public let fx: String?

        public let fy: String?

        public let fr: String?

        public let href: IETF.RFC.`3987`.IRI.Reference?

        public let gradientUnits: Units?

        public let gradientTransform: String?

        public let spreadMethod: Spread?

        public init(
            id: String? = nil,
            cx: String? = nil,
            cy: String? = nil,
            r: String? = nil,
            fx: String? = nil,
            fy: String? = nil,
            fr: String? = nil,
            href: IETF.RFC.`3987`.IRI.Reference? = nil,
            gradientUnits: Units? = nil,
            gradientTransform: String? = nil,
            spreadMethod: Spread? = nil
        ) {
            self.id = id
            self.cx = cx
            self.cy = cy
            self.r = r
            self.fx = fx
            self.fy = fy
            self.fr = fr
            self.href = href
            self.gradientUnits = gradientUnits
            self.gradientTransform = gradientTransform
            self.spreadMethod = spreadMethod
        }
    }
}

extension W3C.SVG.`2`.Paint.RadialGradient {

    public static let tagName = "radialGradient"

    public static let isSelfClosing = false
}
