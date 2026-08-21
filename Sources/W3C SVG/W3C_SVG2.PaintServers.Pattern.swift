extension W3C_SVG2.PaintServers {

    public struct Pattern: SVGElementType, Sendable, Equatable {

        public let id: String?

        public let x: W3C_SVG2.X?

        public let y: W3C_SVG2.Y?

        public let width: W3C_SVG2.Width?

        public let height: W3C_SVG2.Height?

        public let viewBox: W3C_SVG2.Types.ViewBox?

        public let href: String?

        public let patternUnits: Units?

        public let patternContentUnits: Units?

        public let patternTransform: String?

        public let preserveAspectRatio: String?

        public init(
            id: String? = nil,
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil,
            viewBox: W3C_SVG2.Types.ViewBox? = nil,
            href: String? = nil,
            patternUnits: Units? = nil,
            patternContentUnits: Units? = nil,
            patternTransform: String? = nil,
            preserveAspectRatio: String? = nil
        ) {
            self.id = id
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.viewBox = viewBox
            self.href = href
            self.patternUnits = patternUnits
            self.patternContentUnits = patternContentUnits
            self.patternTransform = patternTransform
            self.preserveAspectRatio = preserveAspectRatio
        }
    }
}

extension W3C_SVG2.PaintServers.Pattern {

    public enum Units: String, Sendable, Equatable {

        case userSpaceOnUse

        case objectBoundingBox
    }

    public static let tagName = "pattern"

    public static let isSelfClosing = false
}
