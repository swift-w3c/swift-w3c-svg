//
//  W3C_SVG2.Paths.Path.Command.swift
//  swift-w3c-svg
//
//  SVG path commands (SVG 2 Section 9)
//

import Format_Primitives
public import Geometry_Primitives

extension W3C_SVG2.Paths.Path {
    /// SVG path command
    ///
    /// W3C SVG 2 Section 9.3
    /// https://www.w3.org/TR/SVG2/paths.html#PathData
    ///
    /// Represents a single path command in absolute coordinates.
    /// Used as an intermediate representation for parsing and serialization.
    public enum Command: Sendable, Equatable {
        /// Move to point (M)
        case moveTo(W3C_SVG2.Point)

        /// Line to point (L)
        case lineTo(W3C_SVG2.Point)

        /// Horizontal line to x coordinate (H)
        case horizontalLineTo(x: W3C_SVG2.SVGGeometry.X)

        /// Vertical line to y coordinate (V)
        case verticalLineTo(y: W3C_SVG2.SVGGeometry.Y)

        /// Cubic Bezier curve (C)
        case cubicBezier(W3C_SVG2.Bezier)

        /// Smooth cubic Bezier curve (S)
        case smoothCubicBezier(
            control2: W3C_SVG2.Point,
            end: W3C_SVG2.Point
        )

        /// Quadratic Bezier curve (Q)
        case quadraticBezier(
            control: W3C_SVG2.Point,
            end: W3C_SVG2.Point
        )

        /// Smooth quadratic Bezier curve (T)
        case smoothQuadraticBezier(end: W3C_SVG2.Point)

        /// Elliptical arc (A)
        case arc(Arc)

        /// Close path (Z)
        case closePath
    }
}

// MARK: - Command.Arc

extension W3C_SVG2.Paths.Path.Command {
    /// Elliptical arc command parameters
    ///
    /// W3C SVG 2 Section 9.5.1
    /// https://www.w3.org/TR/SVG2/paths.html#PathDataEllipticalArcCommands
    public struct Arc: Sendable, Equatable {
        /// X radius of the ellipse
        public var rx: Double

        /// Y radius of the ellipse
        public var ry: Double

        /// Rotation of the ellipse in degrees
        public var xAxisRotation: Degree<Double>

        /// If true, use the larger arc
        public var largeArcFlag: Bool

        /// If true, arc is drawn in positive-angle direction
        public var sweepFlag: Bool

        /// The endpoint of the arc
        public var end: W3C_SVG2.Point

        /// Creates an arc command.
        ///
        /// - Parameters:
        ///   - rx: X radius of the ellipse
        ///   - ry: Y radius of the ellipse
        ///   - xAxisRotation: Rotation of the ellipse in degrees
        ///   - largeArcFlag: If true, use the larger arc
        ///   - sweepFlag: If true, arc is drawn in positive-angle direction
        ///   - end: The endpoint of the arc
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

// MARK: - Command Serialization

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
