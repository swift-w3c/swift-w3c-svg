@_exported public import Geometry_Primitives

extension W3C_SVG2 {

    public typealias SVGGeometry = Geometry<Double, W3C_SVG.Space>
}

extension W3C_SVG2 {

    public typealias Circle = SVGGeometry.Circle

    public typealias Rectangle = SVGGeometry.Rectangle

    public typealias Ellipse = SVGGeometry.Ellipse

    public typealias Line = SVGGeometry.Line.Segment

    public typealias Polygon = SVGGeometry.Polygon

    public typealias Path = SVGGeometry.Path

    public typealias Arc = SVGGeometry.Arc

    public typealias Bezier = SVGGeometry.Bezier

    public typealias Triangle = SVGGeometry.Triangle
}

extension W3C_SVG2 {

    public typealias X = SVGGeometry.X

    public typealias Y = SVGGeometry.Y

    public typealias Width = SVGGeometry.Width

    public typealias Height = SVGGeometry.Height

    public typealias Dx = SVGGeometry.Dx

    public typealias Dy = SVGGeometry.Dy

    public typealias Radius = SVGGeometry.Radius

    public typealias Point = SVGGeometry.Point<2>

    public typealias Vector = SVGGeometry.Vector<2>

    public typealias Degrees = Degree<Double>
}

extension W3C_SVG2 {

    public typealias Transform = SVGGeometry.Transform
}

extension W3C_SVG2 {

    @available(*, deprecated, renamed: "SVGGeometry")
    public typealias SVGSpace = SVGGeometry

    public typealias PathGeometry<Space> = Geometry<Double, Space>.Path
}
