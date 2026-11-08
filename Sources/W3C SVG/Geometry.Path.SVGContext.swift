import Formatter
public import Geometry
public import Segment


extension Geometry.Path where Scalar == Double, Space == W3C_SVG.Space {
    public struct SVGContext {

        public let path: Geometry<Double, W3C_SVG.Space>.Path

        public init(_ path: Geometry<Double, W3C_SVG.Space>.Path) {
            self.path = path
        }
    }
}
