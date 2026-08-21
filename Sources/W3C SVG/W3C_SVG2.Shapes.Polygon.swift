import Format_Primitives

extension W3C_SVG2.Shapes {

    public typealias Polygon = W3C_SVG2.Polygon
}

extension W3C_SVG2.Polygon {

    public var points: String {
        vertices.map {
            "\($0.x.formatted(.number)),\($0.y.formatted(.number))"
        }.joined(separator: " ")
    }

    public init(coordinates: [(W3C_SVG2.X, W3C_SVG2.Y)]) {
        self.init(vertices: coordinates.map { .init(x: $0.0, y: $0.1) })
    }
}

extension W3C_SVG2.Polygon: SVGElementType {

    public static let tagName = "polygon"

    public static let isSelfClosing = false
}
