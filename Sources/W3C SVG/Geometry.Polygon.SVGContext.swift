import Formatter
public import Geometry
import Segment
public import W3C

extension Geometry.Polygon where Scalar == Double, Space == W3C.SVG.Space {
    public struct SVGContext {

        public let polygon: Geometry<Double, W3C.SVG.Space>.Polygon

        public init(_ polygon: Geometry<Double, W3C.SVG.Space>.Polygon) {
            self.polygon = polygon
        }
    }
}
