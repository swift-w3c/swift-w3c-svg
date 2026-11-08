import Formatter
public import Geometry
public import Segment

extension Geometry.Ellipse where Scalar == Double, Space == W3C_SVG.Space {
    public struct SVGContext {

        public let ellipse: Geometry<Double, W3C_SVG.Space>.Ellipse

        public init(_ ellipse: Geometry<Double, W3C_SVG.Space>.Ellipse) {
            self.ellipse = ellipse
        }
    }
}
