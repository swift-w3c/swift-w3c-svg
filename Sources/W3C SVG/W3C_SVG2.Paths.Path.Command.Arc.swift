import Formatter
public import Geometry


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
