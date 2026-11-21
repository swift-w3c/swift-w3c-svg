public import Geometry
import Numeric
public import W3C

extension Geometry.Path.Segment where Scalar == Double, Space == W3C.SVG.Space {

    public init(svgArc: W3C.SVG.`2`.Paths.Path.Command.Arc, from: W3C.SVG.`2`.Point) {
        self.init(
            from: from,
            to: svgArc.end,
            rx: W3C.SVG.`2`.SVGGeometry.Length(svgArc.rx),
            ry: W3C.SVG.`2`.SVGGeometry.Length(svgArc.ry),
            xAxisRotation: svgArc.xAxisRotation.radians,
            extent: svgArc.largeArcFlag ? .major : .minor,
            direction: svgArc.sweepFlag ? .positive : .negative
        )
    }
}
