import Format_Primitives

extension W3C_SVG2.Shapes {

    public struct Polyline: SVGElementType, Sendable, Equatable {

        public let points: String?

        public init(
            points: String? = nil
        ) {
            self.points = points
        }

        public init(coordinates: [(W3C_SVG2.X, W3C_SVG2.Y)]) {
            self.points = coordinates.map {
                "\($0.0.formatted(.number)),\($0.1.formatted(.number))"
            }.joined(separator: " ")
        }
    }
}

extension W3C_SVG2.Shapes.Polyline {

    public static let tagName = "polyline"

    public static let isSelfClosing = false
}
