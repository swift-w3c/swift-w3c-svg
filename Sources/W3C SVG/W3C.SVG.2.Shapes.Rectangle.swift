public import W3C

extension W3C.SVG.`2`.Shapes {

    public typealias Rectangle = W3C.SVG.`2`.Rectangle
}

extension W3C.SVG.`2`.Rectangle {

    @inlinable
    public var x: W3C.SVG.`2`.X { llx }

    @inlinable
    public var y: W3C.SVG.`2`.Y { lly }
}

extension W3C.SVG.`2`.Rectangle: SVGElementType {

    public static let tagName = "rect"

    public static let isSelfClosing = false
}
