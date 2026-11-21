import Formatter
public import Geometry
import Segment
public import W3C

extension Geometry.Orthotope where N == 2, Scalar == Double, Space == W3C.SVG.Space {
    public struct SVGContext {

        public let rectangle: Geometry<Double, W3C.SVG.Space>.Rectangle

        public init(_ rectangle: Geometry<Double, W3C.SVG.Space>.Rectangle) {
            self.rectangle = rectangle
        }
    }
}
