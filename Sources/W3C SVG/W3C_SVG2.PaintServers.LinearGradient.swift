extension W3C_SVG2.PaintServers {

    public struct LinearGradient: SVGElementType, Sendable, Equatable {

        public let id: String?

        public let x1: String?

        public let y1: String?

        public let x2: String?

        public let y2: String?

        public let href: String?

        public let gradientUnits: GradientUnits?

        public let gradientTransform: String?

        public let spreadMethod: SpreadMethod?

        public init(
            id: String? = nil,
            x1: String? = nil,
            y1: String? = nil,
            x2: String? = nil,
            y2: String? = nil,
            href: String? = nil,
            gradientUnits: GradientUnits? = nil,
            gradientTransform: String? = nil,
            spreadMethod: SpreadMethod? = nil
        ) {
            self.id = id
            self.x1 = x1
            self.y1 = y1
            self.x2 = x2
            self.y2 = y2
            self.href = href
            self.gradientUnits = gradientUnits
            self.gradientTransform = gradientTransform
            self.spreadMethod = spreadMethod
        }
    }
}

extension W3C_SVG2.PaintServers.LinearGradient {

    public enum GradientUnits: String, Sendable, Equatable {

        case userSpaceOnUse

        case objectBoundingBox
    }

    public enum SpreadMethod: String, Sendable, Equatable {

        case pad

        case reflect

        case `repeat`
    }

    public static let tagName = "linearGradient"

    public static let isSelfClosing = false
}
