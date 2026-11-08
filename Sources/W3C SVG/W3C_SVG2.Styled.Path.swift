extension W3C_SVG2.Styled {
    public struct Path: Sendable, Hashable {

        public var geometry: W3C_SVG2.Path

        public var fill: W3C_SVG2.Types.Color?

        public var fillRule: W3C_SVG2.Painting.FillRule?

        public var stroke: Stroke?

        public init(
            geometry: W3C_SVG2.Path,
            fill: W3C_SVG2.Types.Color? = nil,
            fillRule: W3C_SVG2.Painting.FillRule? = nil,
            stroke: Stroke? = nil
        ) {
            self.geometry = geometry
            self.fill = fill
            self.fillRule = fillRule
            self.stroke = stroke
        }
    }
}
