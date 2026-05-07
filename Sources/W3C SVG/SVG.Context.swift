//
//  SVG.Context.swift
//  swift-w3c-svg
//
//  Context wrappers that convert geometry types to SVG elements.
//

import Format_Primitives

// MARK: - Circle Context

extension Geometry.Ball where N == 2, Scalar == Double, Space == W3C_SVG.Space {
    /// Access SVG-specific functionality for this circle.
    public var svg: SVGContext { SVGContext(self) }

    /// Context wrapper providing SVG element conversion.
    public struct SVGContext {
        /// The underlying circle geometry.
        public let circle: Geometry<Double, W3C_SVG.Space>.Circle

        /// Creates an SVG context for a circle.
        public init(_ circle: Geometry<Double, W3C_SVG.Space>.Circle) {
            self.circle = circle
        }

        /// Convert to an SVG circle element.
        ///
        /// Returns `nil` if the radius is negative.
        public var element: W3C_SVG2.Shapes.Circle? {
            guard circle.radius.underlying >= 0 else { return nil }
            return W3C_SVG2.Shapes.Circle(
                cx: circle.center.x,
                cy: circle.center.y,
                r: circle.radius
            )
        }
    }
}

// MARK: - Rectangle Context

extension Geometry.Orthotope where N == 2, Scalar == Double, Space == W3C_SVG.Space {
    /// Access SVG-specific functionality for this rectangle.
    public var svg: SVGContext { SVGContext(self) }

    /// Context wrapper providing SVG element conversion.
    public struct SVGContext {
        /// The underlying rectangle geometry.
        public let rectangle: Geometry<Double, W3C_SVG.Space>.Rectangle

        /// Creates an SVG context for a rectangle.
        public init(_ rectangle: Geometry<Double, W3C_SVG.Space>.Rectangle) {
            self.rectangle = rectangle
        }

        /// Convert to an SVG rect element.
        ///
        /// Returns `nil` if width or height is negative.
        public var element: W3C_SVG2.Shapes.Rectangle? {
            guard rectangle.width.underlying >= 0, rectangle.height.underlying >= 0 else { return nil }
            return W3C_SVG2.Shapes.Rectangle(
                x: rectangle.llx,
                y: rectangle.lly,
                width: rectangle.width,
                height: rectangle.height
            )
        }
    }
}

// MARK: - Ellipse Context

extension Geometry.Ellipse where Scalar == Double, Space == W3C_SVG.Space {
    /// Access SVG-specific functionality for this ellipse.
    public var svg: SVGContext { SVGContext(self) }

    /// Context wrapper providing SVG element conversion.
    public struct SVGContext {
        /// The underlying ellipse geometry.
        public let ellipse: Geometry<Double, W3C_SVG.Space>.Ellipse

        /// Creates an SVG context for an ellipse.
        public init(_ ellipse: Geometry<Double, W3C_SVG.Space>.Ellipse) {
            self.ellipse = ellipse
        }

        /// Convert to an SVG ellipse element.
        ///
        /// Returns `nil` if either radius is negative.
        public var element: W3C_SVG2.Shapes.Ellipse? {
            guard ellipse.semiMajor.underlying >= 0, ellipse.semiMinor.underlying >= 0 else { return nil }
            return W3C_SVG2.Shapes.Ellipse(
                cx: ellipse.center.x,
                cy: ellipse.center.y,
                rx: Geometry<Double, W3C_SVG.Space>.Width(ellipse.semiMajor.underlying),
                ry: Geometry<Double, W3C_SVG.Space>.Height(ellipse.semiMinor.underlying)
            )
        }
    }
}

// MARK: - Line Context

extension Geometry.Line.Segment where Scalar == Double, Space == W3C_SVG.Space {
    /// Access SVG-specific functionality for this line segment.
    public var svg: SVGContext { SVGContext(self) }

    /// Context wrapper providing SVG element conversion.
    public struct SVGContext {
        /// The underlying line segment geometry.
        public let segment: Geometry<Double, W3C_SVG.Space>.Line.Segment

        /// Creates an SVG context for a line segment.
        public init(_ segment: Geometry<Double, W3C_SVG.Space>.Line.Segment) {
            self.segment = segment
        }

        /// Convert to an SVG line element.
        public var element: W3C_SVG2.Shapes.Line {
            W3C_SVG2.Shapes.Line(
                x1: segment.start.x,
                y1: segment.start.y,
                x2: segment.end.x,
                y2: segment.end.y
            )
        }
    }
}

// MARK: - Polygon Context

extension Geometry.Polygon where Scalar == Double, Space == W3C_SVG.Space {
    /// Access SVG-specific functionality for this polygon.
    public var svg: SVGContext { SVGContext(self) }

    /// Context wrapper providing SVG element conversion.
    public struct SVGContext {
        /// The underlying polygon geometry.
        public let polygon: Geometry<Double, W3C_SVG.Space>.Polygon

        /// Creates an SVG context for a polygon.
        public init(_ polygon: Geometry<Double, W3C_SVG.Space>.Polygon) {
            self.polygon = polygon
        }

        /// Convert to an SVG polygon element.
        public var element: W3C_SVG2.Shapes.Polygon {
            let coordinates = polygon.vertices.map { ($0.x, $0.y) }
            return W3C_SVG2.Shapes.Polygon(coordinates: coordinates)
        }
    }
}

// MARK: - Path Context

extension Geometry.Path where Scalar == Double, Space == W3C_SVG.Space {
    /// Access SVG-specific functionality for this path.
    public var svg: SVGContext { SVGContext(self) }

    /// Context wrapper providing SVG element conversion.
    public struct SVGContext {
        /// The underlying path geometry.
        public let path: Geometry<Double, W3C_SVG.Space>.Path

        /// Creates an SVG context for a path.
        public init(_ path: Geometry<Double, W3C_SVG.Space>.Path) {
            self.path = path
        }

        /// Convert to an SVG path element.
        public var element: W3C_SVG2.Paths.Path {
            W3C_SVG2.Paths.Path(geometry: path)
        }
    }
}
