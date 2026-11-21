public import W3C

extension W3C.SVG.`2`.Shapes {

    public typealias Circle = W3C.SVG.`2`.Circle
}

extension W3C.SVG.`2`.Circle {

    @inlinable
    public var cx: W3C.SVG.`2`.X { center.x }

    @inlinable
    public var cy: W3C.SVG.`2`.Y { center.y }

    @inlinable
    public var r: W3C.SVG.`2`.Radius { radius }

    @inlinable
    public init(
        cx: W3C.SVG.`2`.X = .init(0),
        cy: W3C.SVG.`2`.Y = .init(0),
        r: W3C.SVG.`2`.Radius = .init(0)
    ) {
        self.init(center: .init(x: cx, y: cy), radius: r)
    }
}

extension W3C.SVG.`2`.Circle: SVGElementType {

    public static let tagName = "circle"

    public static let isSelfClosing = false
}
