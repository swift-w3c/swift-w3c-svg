extension W3C_SVG2.Shapes {

    public typealias Rectangle = W3C_SVG2.Rectangle
}

extension W3C_SVG2.Rectangle {

    @inlinable
    public var x: W3C_SVG2.X { llx }

    @inlinable
    public var y: W3C_SVG2.Y { lly }
}

extension W3C_SVG2.Rectangle: SVGElementType {

    public static let tagName = "rect"

    public static let isSelfClosing = false
}
