import Formatter
public import W3C

extension W3C.SVG.`2`.Shapes {

    public typealias Polygon = W3C.SVG.`2`.Polygon
}

extension W3C.SVG.`2`.Polygon {

    public var points: String {
        vertices.map {
            "\($0.x.formatted(Formatter.Number())),\($0.y.formatted(Formatter.Number()))"
        }.joined(separator: " ")
    }

    public init(coordinates: [(W3C.SVG.`2`.X, W3C.SVG.`2`.Y)]) {
        self.init(vertices: coordinates.map { .init(x: $0.0, y: $0.1) })
    }
}

extension W3C.SVG.`2`.Polygon: SVGElementType {

    public static let tagName = "polygon"

    public static let isSelfClosing = false
}
