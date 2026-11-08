extension W3C_SVG2.Styled {
    public struct Stroke: Sendable, Hashable {

        public var color: W3C_SVG2.Types.Color

        public var width: W3C_SVG2.Width?

        public var lineCap: W3C_SVG2.Painting.LineCap?

        public var lineJoin: W3C_SVG2.Painting.LineJoin?

        public init(
            color: W3C_SVG2.Types.Color,
            width: W3C_SVG2.Width? = nil,
            lineCap: W3C_SVG2.Painting.LineCap? = nil,
            lineJoin: W3C_SVG2.Painting.LineJoin? = nil
        ) {
            self.color = color
            self.width = width
            self.lineCap = lineCap
            self.lineJoin = lineJoin
        }
    }
}
