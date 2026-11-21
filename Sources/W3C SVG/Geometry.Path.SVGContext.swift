import Formatter
public import Geometry
import Segment
public import W3C

extension Geometry.Path where Scalar == Double, Space == W3C.SVG.Space {
    public struct SVGContext {

        public let path: Geometry<Double, W3C.SVG.Space>.Path

        public init(_ path: Geometry<Double, W3C.SVG.Space>.Path) {
            self.path = path
        }
    }
}
