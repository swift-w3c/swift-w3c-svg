import Formatter
public import Geometry
public import Segment
public import W3C

extension W3C.SVG.Context {
    /// An owned SVG interpretation; the generic endpoint atom is not an SVG view.
    public struct Segment {

        public let segment: Geometry<Double, W3C.SVG.Space>.Line.Segment

        public init(_ segment: Geometry<Double, W3C.SVG.Space>.Line.Segment) {
            self.segment = segment
        }
    }
}
