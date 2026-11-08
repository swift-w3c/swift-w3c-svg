extension W3C_SVG2.Styled {
    public struct Ellipse: Sendable, Hashable {

        public var geometry: W3C_SVG2.Ellipse

        public var fill: W3C_SVG2.Types.Color?

        public var stroke: Stroke?

        public init(
            geometry: W3C_SVG2.Ellipse,
            fill: W3C_SVG2.Types.Color? = nil,
            stroke: Stroke? = nil
        ) {
            self.geometry = geometry
            self.fill = fill
            self.stroke = stroke
        }
    }
}
