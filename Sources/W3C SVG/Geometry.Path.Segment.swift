public import Geometry
import Numeric

extension Geometry.Path.Segment where Scalar == Double, Space == W3C_SVG.Space {

    public init(svgArc: W3C_SVG2.Paths.Path.Command.Arc, from: W3C_SVG2.Point) {
        self.init(
            from: from,
            to: svgArc.end,
            rx: W3C_SVG2.SVGGeometry.Length(svgArc.rx),
            ry: W3C_SVG2.SVGGeometry.Length(svgArc.ry),
            xAxisRotation: svgArc.xAxisRotation.radians,
            extent: svgArc.largeArcFlag ? .major : .minor,
            direction: svgArc.sweepFlag ? .positive : .negative
        )
    }
}
