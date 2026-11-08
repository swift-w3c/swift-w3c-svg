import Formatter
public import Geometry
public import Segment

extension Geometry.Ball where N == 2, Scalar == Double, Space == W3C_SVG.Space {

    public var svg: SVGContext { SVGContext(self) }

    public struct SVGContext {

        public let circle: Geometry<Double, W3C_SVG.Space>.Circle

        public init(_ circle: Geometry<Double, W3C_SVG.Space>.Circle) {
            self.circle = circle
        }
    }
}

extension Geometry.Ball.SVGContext where N == 2, Scalar == Double, Space == W3C_SVG.Space {

    public var element: W3C_SVG2.Shapes.Circle? {
        guard circle.radius.underlying >= 0 else { return nil }
        return W3C_SVG2.Shapes.Circle(
            cx: circle.center.x,
            cy: circle.center.y,
            r: circle.radius
        )
    }
}

extension Geometry.Orthotope where N == 2, Scalar == Double, Space == W3C_SVG.Space {

    public var svg: SVGContext { SVGContext(self) }

}

extension Geometry.Orthotope.SVGContext where N == 2, Scalar == Double, Space == W3C_SVG.Space {

    public var element: W3C_SVG2.Shapes.Rectangle? {
        guard rectangle.width.underlying >= 0, rectangle.height.underlying >= 0 else {
            return nil
        }
        return W3C_SVG2.Shapes.Rectangle(
            x: rectangle.llx,
            y: rectangle.lly,
            width: rectangle.width,
            height: rectangle.height
        )
    }
}

extension Geometry.Ellipse where Scalar == Double, Space == W3C_SVG.Space {

    public var svg: SVGContext { SVGContext(self) }

}

extension Geometry.Ellipse.SVGContext where Scalar == Double, Space == W3C_SVG.Space {

    public var element: W3C_SVG2.Shapes.Ellipse? {
        guard ellipse.semiMajor.underlying >= 0, ellipse.semiMinor.underlying >= 0 else {
            return nil
        }
        return W3C_SVG2.Shapes.Ellipse(
            cx: ellipse.center.x,
            cy: ellipse.center.y,
            rx: Geometry<Double, W3C_SVG.Space>.Width(ellipse.semiMajor.underlying),
            ry: Geometry<Double, W3C_SVG.Space>.Height(ellipse.semiMinor.underlying)
        )
    }
}

extension W3C_SVG {
}

extension W3C_SVG.Context {
}

extension Segment::Segment where Point == Geometry<Double, W3C_SVG.Space>.Point<2> {
    public var svg: W3C_SVG.Context.Segment { .init(self) }
}

extension W3C_SVG.Context.Segment {

    public var element: W3C_SVG2.Shapes.Line {
        W3C_SVG2.Shapes.Line(
            x1: segment.start.x,
            y1: segment.start.y,
            x2: segment.end.x,
            y2: segment.end.y
        )
    }
}

extension Geometry.Polygon where Scalar == Double, Space == W3C_SVG.Space {

    public var svg: SVGContext { SVGContext(self) }

}

extension Geometry.Polygon.SVGContext where Scalar == Double, Space == W3C_SVG.Space {

    public var element: W3C_SVG2.Shapes.Polygon {
        let coordinates = polygon.vertices.map { ($0.x, $0.y) }
        return W3C_SVG2.Shapes.Polygon(coordinates: coordinates)
    }
}

extension Geometry.Path where Scalar == Double, Space == W3C_SVG.Space {

    public var svg: SVGContext { SVGContext(self) }

}

extension Geometry.Path.SVGContext where Scalar == Double, Space == W3C_SVG.Space {

    public var element: W3C_SVG2.Paths.Path {
        W3C_SVG2.Paths.Path(geometry: path)
    }
}
