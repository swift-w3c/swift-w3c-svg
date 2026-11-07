import Formatter
public import Geometry
public import Segment


extension W3C_SVG.Context {
    /// An owned SVG interpretation; the generic endpoint atom is not an SVG view.
    public struct Segment {

        public let segment: Geometry<Double, W3C_SVG.Space>.Line.Segment

        public init(_ segment: Geometry<Double, W3C_SVG.Space>.Line.Segment) {
            self.segment = segment
        }
    }
}
