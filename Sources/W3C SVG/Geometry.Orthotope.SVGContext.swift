import Formatter
public import Geometry
public import Segment

extension Geometry.Orthotope where N == 2, Scalar == Double, Space == W3C_SVG.Space {
    public struct SVGContext {

        public let rectangle: Geometry<Double, W3C_SVG.Space>.Rectangle

        public init(_ rectangle: Geometry<Double, W3C_SVG.Space>.Rectangle) {
            self.rectangle = rectangle
        }
    }
}
