extension W3C_SVG2.Painting {

    public struct Marker: SVGElementType, Sendable, Equatable {

        public let id: String?

        public let viewBox: W3C_SVG2.Types.ViewBox?

        public let refX: W3C_SVG2.X?

        public let refY: W3C_SVG2.Y?

        public let markerWidth: W3C_SVG2.Width?

        public let markerHeight: W3C_SVG2.Height?

        public let orient: String?

        public let markerUnits: Units?

        public let preserveAspectRatio: String?

        public init(
            id: String? = nil,
            viewBox: W3C_SVG2.Types.ViewBox? = nil,
            refX: W3C_SVG2.X? = nil,
            refY: W3C_SVG2.Y? = nil,
            markerWidth: W3C_SVG2.Width? = nil,
            markerHeight: W3C_SVG2.Height? = nil,
            orient: String? = nil,
            markerUnits: Units? = nil,
            preserveAspectRatio: String? = nil
        ) {
            self.id = id
            self.viewBox = viewBox
            self.refX = refX
            self.refY = refY
            self.markerWidth = markerWidth
            self.markerHeight = markerHeight
            self.orient = orient
            self.markerUnits = markerUnits
            self.preserveAspectRatio = preserveAspectRatio
        }
    }
}

extension W3C_SVG2.Painting.Marker {

    public enum Units: String, Sendable, Equatable {

        case strokeWidth

        case userSpaceOnUse
    }

    public static let tagName = "marker"

    public static let isSelfClosing = false
}
