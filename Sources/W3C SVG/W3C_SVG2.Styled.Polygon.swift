extension W3C_SVG2.Styled {
    public struct Polygon: Sendable, Hashable {

        public var geometry: W3C_SVG2.Polygon

        public var fill: W3C_SVG2.Types.Color?

        public var stroke: Stroke?

        public init(
            geometry: W3C_SVG2.Polygon,
            fill: W3C_SVG2.Types.Color? = nil,
            stroke: Stroke? = nil
        ) {
            self.geometry = geometry
            self.fill = fill
            self.stroke = stroke
        }
    }
}
