extension W3C_SVG2 {

    public enum Styled {}
}

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

extension W3C_SVG2.Styled {

    public struct Circle: Sendable, Hashable {

        public var geometry: W3C_SVG2.Circle

        public var fill: W3C_SVG2.Types.Color?

        public var stroke: Stroke?

        public init(
            geometry: W3C_SVG2.Circle,
            fill: W3C_SVG2.Types.Color? = nil,
            stroke: Stroke? = nil
        ) {
            self.geometry = geometry
            self.fill = fill
            self.stroke = stroke
        }
    }
}

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

extension W3C_SVG2.Styled {

    public struct Line: Sendable, Hashable {

        public var geometry: W3C_SVG2.Line

        public var stroke: Stroke?

        public init(
            geometry: W3C_SVG2.Line,
            stroke: Stroke? = nil
        ) {
            self.geometry = geometry
            self.stroke = stroke
        }
    }
}

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
