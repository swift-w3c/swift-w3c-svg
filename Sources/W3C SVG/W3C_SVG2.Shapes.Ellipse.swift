extension W3C_SVG2.Shapes {

    public typealias Ellipse = W3C_SVG2.Ellipse
}

extension W3C_SVG2.Ellipse {

    @inlinable
    public var cx: W3C_SVG2.X { center.x }

    @inlinable
    public var cy: W3C_SVG2.Y { center.y }

    @inlinable
    public var rx: W3C_SVG2.Width { W3C_SVG2.Width(semiMajor.underlying) }

    @inlinable
    public var ry: W3C_SVG2.Height { W3C_SVG2.Height(semiMinor.underlying) }

    @inlinable
    public init(
        cx: W3C_SVG2.X = .init(0),
        cy: W3C_SVG2.Y = .init(0),
        rx: W3C_SVG2.Width = .init(0),
        ry: W3C_SVG2.Height = .init(0)
    ) {
        self.init(
            center: .init(x: cx, y: cy),
            semiMajor: .init(rx.underlying),
            semiMinor: .init(ry.underlying)
        )
    }
}

extension W3C_SVG2.Ellipse: SVGElementType {

    public static let tagName = "ellipse"

    public static let isSelfClosing = false
}
