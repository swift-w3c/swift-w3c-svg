import Formatter
public import Geometry
import Segment
public import W3C

extension Geometry.Ellipse where Scalar == Double, Space == W3C.SVG.Space {
    public struct SVGContext {

        public let ellipse: Geometry<Double, W3C.SVG.Space>.Ellipse

        public init(_ ellipse: Geometry<Double, W3C.SVG.Space>.Ellipse) {
            self.ellipse = ellipse
        }
    }
}
