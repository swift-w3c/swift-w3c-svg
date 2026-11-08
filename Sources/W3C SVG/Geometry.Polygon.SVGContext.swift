import Formatter
public import Geometry
import Segment

extension Geometry.Polygon where Scalar == Double, Space == W3C_SVG.Space {
    public struct SVGContext {

        public let polygon: Geometry<Double, W3C_SVG.Space>.Polygon

        public init(_ polygon: Geometry<Double, W3C_SVG.Space>.Polygon) {
            self.polygon = polygon
        }
    }
}
