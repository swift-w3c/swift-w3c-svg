public import W3C

extension W3C.SVG.`2`.Styled {
    public struct Stroke: Sendable, Hashable {

        public var color: W3C.SVG.`2`.Types.Color

        public var width: W3C.SVG.`2`.Width?

        public var lineCap: W3C.SVG.`2`.Painting.Line.Cap?

        public var lineJoin: W3C.SVG.`2`.Painting.Line.Join?

        public init(
            color: W3C.SVG.`2`.Types.Color,
            width: W3C.SVG.`2`.Width? = nil,
            lineCap: W3C.SVG.`2`.Painting.Line.Cap? = nil,
            lineJoin: W3C.SVG.`2`.Painting.Line.Join? = nil
        ) {
            self.color = color
            self.width = width
            self.lineCap = lineCap
            self.lineJoin = lineJoin
        }
    }
}
