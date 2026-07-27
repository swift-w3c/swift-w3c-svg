//
//  W3C_SVG2.Styled.swift
//  swift-w3c-svg
//
//  Geometry types combined with SVG styling (fill, stroke).
//

// MARK: - Styled Namespace

extension W3C_SVG2 {
    /// Styled geometry types that combine shape with fill and stroke properties.
    public enum Styled {}
}

// MARK: - Stroke Configuration

extension W3C_SVG2.Styled {
    /// Stroke configuration for SVG shapes.
    public struct Stroke: Sendable, Hashable {
        /// The stroke color.
        public var color: W3C_SVG2.Types.Color

        /// The stroke width.
        public var width: W3C_SVG2.Width?

        /// The line cap style.
        public var lineCap: W3C_SVG2.Painting.LineCap?

        /// The line join style.
        public var lineJoin: W3C_SVG2.Painting.LineJoin?

        /// Creates a stroke configuration.
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

// MARK: - Styled Circle

extension W3C_SVG2.Styled {
    /// A circle with fill and stroke styling.
    public struct Circle: Sendable, Hashable {
        /// The circle geometry.
        public var geometry: W3C_SVG2.Circle

        /// The fill color.
        public var fill: W3C_SVG2.Types.Color?

        /// The stroke configuration.
        public var stroke: Stroke?

        /// Creates a styled circle.
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

// MARK: - Styled Rectangle

extension W3C_SVG2.Styled {
    /// A rectangle with fill and stroke styling.
    public struct Rectangle: Sendable, Hashable {
        /// The rectangle geometry.
        public var geometry: W3C_SVG2.Rectangle

        /// The fill color.
        public var fill: W3C_SVG2.Types.Color?

        /// The stroke configuration.
        public var stroke: Stroke?

        /// Corner radius for x-axis (optional).
        public var rx: W3C_SVG2.Width?

        /// Corner radius for y-axis (optional).
        public var ry: W3C_SVG2.Height?

        /// Creates a styled rectangle.
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

// MARK: - Styled Ellipse

extension W3C_SVG2.Styled {
    /// An ellipse with fill and stroke styling.
    public struct Ellipse: Sendable, Hashable {
        /// The ellipse geometry.
        public var geometry: W3C_SVG2.Ellipse

        /// The fill color.
        public var fill: W3C_SVG2.Types.Color?

        /// The stroke configuration.
        public var stroke: Stroke?

        /// Creates a styled ellipse.
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

// MARK: - Styled Line

extension W3C_SVG2.Styled {
    /// A line with stroke styling.
    public struct Line: Sendable, Hashable {
        /// The line geometry.
        public var geometry: W3C_SVG2.Line

        /// The stroke configuration.
        public var stroke: Stroke?

        /// Creates a styled line.
        public init(
            geometry: W3C_SVG2.Line,
            stroke: Stroke? = nil
        ) {
            self.geometry = geometry
            self.stroke = stroke
        }
    }
}

// MARK: - Styled Polygon

extension W3C_SVG2.Styled {
    /// A polygon with fill and stroke styling.
    public struct Polygon: Sendable, Hashable {
        /// The polygon geometry.
        public var geometry: W3C_SVG2.Polygon

        /// The fill color.
        public var fill: W3C_SVG2.Types.Color?

        /// The stroke configuration.
        public var stroke: Stroke?

        /// Creates a styled polygon.
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

// MARK: - Styled Path

extension W3C_SVG2.Styled {
    /// A path with fill and stroke styling.
    public struct Path: Sendable, Hashable {
        /// The path geometry.
        public var geometry: W3C_SVG2.Path

        /// The fill color.
        public var fill: W3C_SVG2.Types.Color?

        /// The fill rule.
        public var fillRule: W3C_SVG2.Painting.FillRule?

        /// The stroke configuration.
        public var stroke: Stroke?

        /// Creates a styled path.
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
