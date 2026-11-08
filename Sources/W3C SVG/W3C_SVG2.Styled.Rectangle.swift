extension W3C_SVG2.Styled {
    public struct Rectangle: Sendable, Hashable {

        public var geometry: W3C_SVG2.Rectangle

        public var fill: W3C_SVG2.Types.Color?

        public var stroke: Stroke?

        public var rx: W3C_SVG2.Width?

        public var ry: W3C_SVG2.Height?

        public init(
            geometry: W3C_SVG2.Rectangle,
            fill: W3C_SVG2.Types.Color? = nil,
            stroke: Stroke? = nil,
            rx: W3C_SVG2.Width? = nil,
            ry: W3C_SVG2.Height? = nil
        ) {
            self.geometry = geometry
            self.fill = fill
            self.stroke = stroke
            self.rx = rx
            self.ry = ry
        }
    }
}
