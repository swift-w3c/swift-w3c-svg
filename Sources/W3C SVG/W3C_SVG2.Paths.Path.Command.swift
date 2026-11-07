import Formatter
public import Geometry

extension W3C_SVG2.Paths.Path {

    public enum Command: Sendable, Equatable {

        case moveTo(W3C_SVG2.Point)

        case lineTo(W3C_SVG2.Point)

        case horizontalLineTo(x: W3C_SVG2.SVGGeometry.X)

        case verticalLineTo(y: W3C_SVG2.SVGGeometry.Y)

        case cubicBezier(W3C_SVG2.Bezier)

        case smoothCubicBezier(
            control2: W3C_SVG2.Point,
            end: W3C_SVG2.Point
        )

        case quadraticBezier(
            control: W3C_SVG2.Point,
            end: W3C_SVG2.Point
        )

        case smoothQuadraticBezier(end: W3C_SVG2.Point)

        case arc(Arc)

        case closePath
    }
}

extension W3C_SVG2.Paths.Path.Command {

    public struct Arc: Sendable, Equatable {

        public var rx: Double

        public var ry: Double

        public var xAxisRotation: Degree<Double>

        public var largeArcFlag: Bool

        public var sweepFlag: Bool

        public var end: W3C_SVG2.Point

        public init(
            rx: Double,
            ry: Double,
            xAxisRotation: Degree<Double>,
            largeArcFlag: Bool,
            sweepFlag: Bool,
            end: W3C_SVG2.Point
        ) {
            self.rx = rx
            self.ry = ry
            self.xAxisRotation = xAxisRotation
            self.largeArcFlag = largeArcFlag
            self.sweepFlag = sweepFlag
            self.end = end
        }

    }
}

extension W3C_SVG2.Paths.Path.Command: CustomStringConvertible {
    public var description: String {
        switch self {
        case .moveTo(let point):
            return
                "M \(point.x.formatted(Formatter.Number())) \(point.y.formatted(Formatter.Number()))"

        case .lineTo(let point):
            return
                "L \(point.x.formatted(Formatter.Number())) \(point.y.formatted(Formatter.Number()))"

        case .horizontalLineTo(let x):
            return "H \(x.formatted(Formatter.Number()))"

        case .verticalLineTo(let y):
            return "V \(y.formatted(Formatter.Number()))"

        case .cubicBezier(let bezier):
            guard bezier.controlPoints.count >= 4 else { return "" }
            let c1 = bezier.controlPoints[1]
            let c2 = bezier.controlPoints[2]
            let end = bezier.controlPoints[3]
            return
                "C \(c1.x.formatted(Formatter.Number())) \(c1.y.formatted(Formatter.Number())) \(c2.x.formatted(Formatter.Number())) \(c2.y.formatted(Formatter.Number())) \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"

        case .smoothCubicBezier(let control2, let end):
            return
                "S \(control2.x.formatted(Formatter.Number())) \(control2.y.formatted(Formatter.Number())) \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"

        case .quadraticBezier(let control, let end):
            return
                "Q \(control.x.formatted(Formatter.Number())) \(control.y.formatted(Formatter.Number())) \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"

        case .smoothQuadraticBezier(let end):
            return "T \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"

        case .arc(let arc):
            let largeArc = arc.largeArcFlag ? "1" : "0"
            let sweep = arc.sweepFlag ? "1" : "0"
            return
                "A \(arc.rx.formatted(Formatter.Number())) \(arc.ry.formatted(Formatter.Number())) \(arc.xAxisRotation.formatted(Formatter.Number())) \(largeArc) \(sweep) \(arc.end.x.formatted(Formatter.Number())) \(arc.end.y.formatted(Formatter.Number()))"

        case .closePath:
            return "Z"
        }
    }
}
