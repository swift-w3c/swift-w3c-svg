extension W3C_SVG2.Shapes {

    public typealias Line = W3C_SVG2.Line
}

extension W3C_SVG2.Line {

    @inlinable
    public var x1: W3C_SVG2.X { start.x }

    @inlinable
    public var y1: W3C_SVG2.Y { start.y }

    @inlinable
    public var x2: W3C_SVG2.X { end.x }

    @inlinable
    public var y2: W3C_SVG2.Y { end.y }

    @inlinable
    public init(
        x1: W3C_SVG2.X = .init(0),
        y1: W3C_SVG2.Y = .init(0),
        x2: W3C_SVG2.X = .init(0),
        y2: W3C_SVG2.Y = .init(0)
    ) {
        self.init(
            start: .init(x: x1, y: y1),
            end: .init(x: x2, y: y2)
        )
    }
}

extension W3C_SVG2.Line: SVGElementType {

    public static let tagName = "line"

    public static let isSelfClosing = false
}
