import Format_Primitives

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

    public struct SVGContext {

        public let rectangle: Geometry<Double, W3C_SVG.Space>.Rectangle

        public init(_ rectangle: Geometry<Double, W3C_SVG.Space>.Rectangle) {
            self.rectangle = rectangle
        }
    }
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

    public struct SVGContext {

        public let ellipse: Geometry<Double, W3C_SVG.Space>.Ellipse

        public init(_ ellipse: Geometry<Double, W3C_SVG.Space>.Ellipse) {
            self.ellipse = ellipse
        }
    }
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

extension Geometry.Line.Segment where Scalar == Double, Space == W3C_SVG.Space {

    public var svg: SVGContext { SVGContext(self) }

    public struct SVGContext {

        public let segment: Geometry<Double, W3C_SVG.Space>.Line.Segment

        public init(_ segment: Geometry<Double, W3C_SVG.Space>.Line.Segment) {
            self.segment = segment
        }
    }
}

extension Geometry.Line.Segment.SVGContext where Scalar == Double, Space == W3C_SVG.Space {

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

    public struct SVGContext {

        public let polygon: Geometry<Double, W3C_SVG.Space>.Polygon

        public init(_ polygon: Geometry<Double, W3C_SVG.Space>.Polygon) {
            self.polygon = polygon
        }
    }
}

extension Geometry.Polygon.SVGContext where Scalar == Double, Space == W3C_SVG.Space {

    public var element: W3C_SVG2.Shapes.Polygon {
        let coordinates = polygon.vertices.map { ($0.x, $0.y) }
        return W3C_SVG2.Shapes.Polygon(coordinates: coordinates)
    }
}

extension Geometry.Path where Scalar == Double, Space == W3C_SVG.Space {

    public var svg: SVGContext { SVGContext(self) }

    public struct SVGContext {

        public let path: Geometry<Double, W3C_SVG.Space>.Path

        public init(_ path: Geometry<Double, W3C_SVG.Space>.Path) {
            self.path = path
        }
    }
}

extension Geometry.Path.SVGContext where Scalar == Double, Space == W3C_SVG.Space {

    public var element: W3C_SVG2.Paths.Path {
        W3C_SVG2.Paths.Path(geometry: path)
    }
}
