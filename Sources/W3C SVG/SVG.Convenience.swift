//
//  W3C_SVG2.Convenience.swift
//  swift-w3c-svg
//
//  Convenience extensions for creating styled geometry.
//

// MARK: - Circle Convenience

extension W3C_SVG2.Circle {
    /// Create a styled circle with a fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Circle {
        W3C_SVG2.Styled.Circle(geometry: self, fill: color)
    }

    /// Create a styled circle with a stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Circle {
        W3C_SVG2.Styled.Circle(geometry: self, stroke: stroke)
    }

    /// Create a styled circle with a stroke color.
    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Circle {
        W3C_SVG2.Styled.Circle(geometry: self, stroke: .init(color: color, width: width))
    }
}

// MARK: - Rectangle Convenience

extension W3C_SVG2.Rectangle {
    /// Create a styled rectangle with a fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Rectangle {
        W3C_SVG2.Styled.Rectangle(geometry: self, fill: color)
    }

    /// Create a styled rectangle with a stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Rectangle {
        W3C_SVG2.Styled.Rectangle(geometry: self, stroke: stroke)
    }

    /// Create a styled rectangle with a stroke color.
    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Rectangle {
        W3C_SVG2.Styled.Rectangle(geometry: self, stroke: .init(color: color, width: width))
    }
}

// MARK: - Ellipse Convenience

extension W3C_SVG2.Ellipse {
    /// Create a styled ellipse with a fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Ellipse {
        W3C_SVG2.Styled.Ellipse(geometry: self, fill: color)
    }

    /// Create a styled ellipse with a stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Ellipse {
        W3C_SVG2.Styled.Ellipse(geometry: self, stroke: stroke)
    }

    /// Create a styled ellipse with a stroke color.
    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Ellipse {
        W3C_SVG2.Styled.Ellipse(geometry: self, stroke: .init(color: color, width: width))
    }
}

// MARK: - Line Convenience

extension W3C_SVG2.Line {
    /// Create a styled line with a stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Line {
        W3C_SVG2.Styled.Line(geometry: self, stroke: stroke)
    }

    /// Create a styled line with a stroke color.
    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Line {
        W3C_SVG2.Styled.Line(geometry: self, stroke: .init(color: color, width: width))
    }
}

// MARK: - Polygon Convenience

extension W3C_SVG2.Polygon {
    /// Create a styled polygon with a fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Polygon {
        W3C_SVG2.Styled.Polygon(geometry: self, fill: color)
    }

    /// Create a styled polygon with a stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Polygon {
        W3C_SVG2.Styled.Polygon(geometry: self, stroke: stroke)
    }

    /// Create a styled polygon with a stroke color.
    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Polygon {
        W3C_SVG2.Styled.Polygon(geometry: self, stroke: .init(color: color, width: width))
    }
}

// MARK: - Path Convenience

extension W3C_SVG2.Path {
    /// Create a styled path with a fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> W3C_SVG2.Styled.Path {
        W3C_SVG2.Styled.Path(geometry: self, fill: color)
    }

    /// Create a styled path with a stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> W3C_SVG2.Styled.Path {
        W3C_SVG2.Styled.Path(geometry: self, stroke: stroke)
    }

    /// Create a styled path with a stroke color.
    public func stroked(
        _ color: W3C_SVG2.Types.Color,
        width: W3C_SVG2.Width? = nil
    ) -> W3C_SVG2.Styled.Path {
        W3C_SVG2.Styled.Path(geometry: self, stroke: .init(color: color, width: width))
    }
}

// MARK: - Styled Circle Chaining

extension W3C_SVG2.Styled.Circle {
    /// Add or update the fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    /// Add or update the stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    /// Add or update the stroke with a color.
    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }
}

// MARK: - Styled Rectangle Chaining

extension W3C_SVG2.Styled.Rectangle {
    /// Add or update the fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    /// Add or update the stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    /// Add or update the stroke with a color.
    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }

    /// Set corner radii for rounded rectangles.
    public func rounded(rx: W3C_SVG2.Width? = nil, ry: W3C_SVG2.Height? = nil) -> Self {
        var copy = self
        copy.rx = rx
        copy.ry = ry
        return copy
    }
}

// MARK: - Styled Ellipse Chaining

extension W3C_SVG2.Styled.Ellipse {
    /// Add or update the fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    /// Add or update the stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    /// Add or update the stroke with a color.
    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }
}

// MARK: - Styled Line Chaining

extension W3C_SVG2.Styled.Line {
    /// Add or update the stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    /// Add or update the stroke with a color.
    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }
}

// MARK: - Styled Polygon Chaining

extension W3C_SVG2.Styled.Polygon {
    /// Add or update the fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    /// Add or update the stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    /// Add or update the stroke with a color.
    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }
}

// MARK: - Styled Path Chaining

extension W3C_SVG2.Styled.Path {
    /// Add or update the fill color.
    public func filled(_ color: W3C_SVG2.Types.Color) -> Self {
        var copy = self
        copy.fill = color
        return copy
    }

    /// Add or update the stroke.
    public func stroked(_ stroke: W3C_SVG2.Styled.Stroke) -> Self {
        var copy = self
        copy.stroke = stroke
        return copy
    }

    /// Add or update the stroke with a color.
    public func stroked(_ color: W3C_SVG2.Types.Color, width: W3C_SVG2.Width? = nil) -> Self {
        var copy = self
        copy.stroke = .init(color: color, width: width)
        return copy
    }

    /// Set the fill rule.
    public func fillRule(_ rule: W3C_SVG2.Painting.FillRule) -> Self {
        var copy = self
        copy.fillRule = rule
        return copy
    }
}
