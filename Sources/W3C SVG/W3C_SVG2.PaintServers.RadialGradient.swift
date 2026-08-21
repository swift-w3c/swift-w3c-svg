extension W3C_SVG2.PaintServers {

    public struct RadialGradient: SVGElementType, Sendable, Equatable {

        public let id: String?

        public let cx: String?

        public let cy: String?

        public let r: String?

        public let fx: String?

        public let fy: String?

        public let fr: String?

        public let href: String?

        public let gradientUnits: GradientUnits?

        public let gradientTransform: String?

        public let spreadMethod: SpreadMethod?

        public init(
            id: String? = nil,
            cx: String? = nil,
            cy: String? = nil,
            r: String? = nil,
            fx: String? = nil,
            fy: String? = nil,
            fr: String? = nil,
            href: String? = nil,
            gradientUnits: GradientUnits? = nil,
            gradientTransform: String? = nil,
            spreadMethod: SpreadMethod? = nil
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

extension W3C_SVG2.PaintServers.RadialGradient {

    public enum GradientUnits: String, Sendable, Equatable {

        case userSpaceOnUse

        case objectBoundingBox
    }

    public enum SpreadMethod: String, Sendable, Equatable {

        case pad

        case reflect

        case `repeat`
    }

    public static let tagName = "radialGradient"

    public static let isSelfClosing = false
}
