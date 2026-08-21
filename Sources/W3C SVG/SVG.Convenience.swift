extension W3C_SVG2.Circle {

    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Circle {
        W3C_SVG2.Styled.Circle(geometry: self, fill: color)
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Circle {
        W3C_SVG2.Styled.Circle(geometry: self, stroke: stroke)
    }

    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Circle {
        W3C_SVG2.Styled.Circle(geometry: self, stroke: .init(color: color, width: width))
    }
}

extension W3C_SVG2.Rectangle {

    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Rectangle {
        W3C_SVG2.Styled.Rectangle(geometry: self, fill: color)
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Rectangle {
        W3C_SVG2.Styled.Rectangle(geometry: self, stroke: stroke)
    }

    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Rectangle {
        W3C_SVG2.Styled.Rectangle(geometry: self, stroke: .init(color: color, width: width))
    }
}

extension W3C_SVG2.Ellipse {

    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Ellipse {
        W3C_SVG2.Styled.Ellipse(geometry: self, fill: color)
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Ellipse {
        W3C_SVG2.Styled.Ellipse(geometry: self, stroke: stroke)
    }

    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Ellipse {
        W3C_SVG2.Styled.Ellipse(geometry: self, stroke: .init(color: color, width: width))
    }
}

extension W3C_SVG2.Line {

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Line {
        W3C_SVG2.Styled.Line(geometry: self, stroke: stroke)
    }

    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Line {
        W3C_SVG2.Styled.Line(geometry: self, stroke: .init(color: color, width: width))
    }
}

extension W3C_SVG2.Polygon {

    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Polygon {
        W3C_SVG2.Styled.Polygon(geometry: self, fill: color)
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Polygon {
        W3C_SVG2.Styled.Polygon(geometry: self, stroke: stroke)
    }

    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Polygon {
        W3C_SVG2.Styled.Polygon(geometry: self, stroke: .init(color: color, width: width))
    }
}

extension W3C_SVG2.Path {

    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Path {
        W3C_SVG2.Styled.Path(geometry: self, fill: color)
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Path {
        W3C_SVG2.Styled.Path(geometry: self, stroke: stroke)
    }

    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Path {
        W3C_SVG2.Styled.Path(geometry: self, stroke: .init(color: color, width: width))
    }
}

extension W3C_SVG2.Styled.Circle {

    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }
}

extension W3C_SVG2.Styled.Rectangle {

    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }

    public func rounded(rx: W3C_SVG2.Width? = nil, ry: W3C_SVG2.Height? = nil) -> Self {
        var copy = self
        copy.rx = rx
        copy.ry = ry
        return copy
    }
}

extension W3C_SVG2.Styled.Ellipse {

    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }
}

extension W3C_SVG2.Styled.Line {

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }
}

extension W3C_SVG2.Styled.Polygon {

    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }
}

extension W3C_SVG2.Styled.Path {

    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }

    public func fillRule(_ rule: W3C_SVG2.Painting.FillRule) -> Self {
        var copy = self
        copy.fillRule = rule
        return copy
    }
}
