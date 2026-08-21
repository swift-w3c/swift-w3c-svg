public import Geometry_Primitives

extension W3C_SVG2.Ellipse.Arc {

    public init(svgArc: W3C_SVG2.Paths.Path.Command.Arc, from: W3C_SVG2.Point) {

        let rotationRadians = svgArc.xAxisRotation.radians

        self.init(
            from: from,
            to: svgArc.end,
            rx: W3C_SVG2.SVGGeometry.Length(svgArc.rx),
            ry: W3C_SVG2.SVGGeometry.Length(svgArc.ry),
            xAxisRotation: rotationRadians,
            largeArcFlag: svgArc.largeArcFlag,
            sweepFlag: svgArc.sweepFlag
        )
    }
}
