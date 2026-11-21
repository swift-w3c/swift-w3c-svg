public import W3C

extension W3C.SVG.`2`.Styled {
    public struct Line: Sendable, Hashable {

        public var geometry: W3C.SVG.`2`.Line

        public var stroke: Stroke?

        public init(
            geometry: W3C.SVG.`2`.Line,
            stroke: Stroke? = nil
        ) {
            self.geometry = geometry
            self.stroke = stroke
        }
    }
}
