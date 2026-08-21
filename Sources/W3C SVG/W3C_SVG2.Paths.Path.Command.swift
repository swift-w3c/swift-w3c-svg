import Format_Primitives
public import Geometry_Primitives

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
                "M \(point.x.formatted(.number)) \(point.y.formatted(.number))"

        case .lineTo(let point):
            return
                "L \(point.x.formatted(.number)) \(point.y.formatted(.number))"

        case .horizontalLineTo(let x):
            return "H \(x.formatted(.number))"

        case .verticalLineTo(let y):
            return "V \(y.formatted(.number))"

        case .cubicBezier(let bezier):
            guard bezier.controlPoints.count >= 4 else { return "" }
            let c1 = bezier.controlPoints[1]
            let c2 = bezier.controlPoints[2]
            let end = bezier.controlPoints[3]
            return
                "C \(c1.x.formatted(.number)) \(c1.y.formatted(.number)) \(c2.x.formatted(.number)) \(c2.y.formatted(.number)) \(end.x.formatted(.number)) \(end.y.formatted(.number))"

        case .smoothCubicBezier(let control2, let end):
            return
                "S \(control2.x.formatted(.number)) \(control2.y.formatted(.number)) \(end.x.formatted(.number)) \(end.y.formatted(.number))"

        case .quadraticBezier(let control, let end):
            return
                "Q \(control.x.formatted(.number)) \(control.y.formatted(.number)) \(end.x.formatted(.number)) \(end.y.formatted(.number))"

        case .smoothQuadraticBezier(let end):
            return "T \(end.x.formatted(.number)) \(end.y.formatted(.number))"

        case .arc(let arc):
            let largeArc = arc.largeArcFlag ? "1" : "0"
            let sweep = arc.sweepFlag ? "1" : "0"
            return
                "A \(arc.rx.formatted(.number)) \(arc.ry.formatted(.number)) \(arc.xAxisRotation.formatted(.number)) \(largeArc) \(sweep) \(arc.end.x.formatted(.number)) \(arc.end.y.formatted(.number))"

        case .closePath:
            return "Z"
        }
    }
}
