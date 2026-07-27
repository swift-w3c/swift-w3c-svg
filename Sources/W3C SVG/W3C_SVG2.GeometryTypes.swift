//
//  W3C_SVG2.GeometryTypes.swift
//  swift-w3c-svg
//
//  Re-exports Geometry module and provides SVG-specific type aliases.
//

@_exported public import Geometry_Primitives

// MARK: - Underlying Geometry Type

extension W3C_SVG2 {
    /// SVG coordinate space geometry.
    ///
    /// This is the base geometry type parameterized for SVG coordinate space.
    /// All SVG geometry types are derived from this.
    public typealias SVGGeometry = Geometry<Double, W3C_SVG.Space>
}

// MARK: - Geometry Primitives

extension W3C_SVG2 {
    /// A circle in SVG coordinate space.
    public typealias Circle = SVGGeometry.Circle

    /// A rectangle in SVG coordinate space.
    public typealias Rectangle = SVGGeometry.Rectangle

    /// An ellipse in SVG coordinate space.
    public typealias Ellipse = SVGGeometry.Ellipse

    /// A line segment in SVG coordinate space.
    public typealias Line = SVGGeometry.Line.Segment

    /// A polygon in SVG coordinate space.
    public typealias Polygon = SVGGeometry.Polygon

    /// A path in SVG coordinate space.
    public typealias Path = SVGGeometry.Path

    /// An arc in SVG coordinate space.
    public typealias Arc = SVGGeometry.Arc

    /// A Bezier curve in SVG coordinate space.
    public typealias Bezier = SVGGeometry.Bezier

    /// A triangle in SVG coordinate space.
    public typealias Triangle = SVGGeometry.Triangle
}

// MARK: - Coordinate Types

extension W3C_SVG2 {
    /// X coordinate in SVG space.
    public typealias X = SVGGeometry.X

    /// Y coordinate in SVG space.
    public typealias Y = SVGGeometry.Y

    /// Width extent in SVG space.
    public typealias Width = SVGGeometry.Width

    /// Height extent in SVG space.
    public typealias Height = SVGGeometry.Height

    /// X displacement in SVG space.
    public typealias Dx = SVGGeometry.Dx

    /// Y displacement in SVG space.
    public typealias Dy = SVGGeometry.Dy

    /// Radius in SVG space.
    public typealias Radius = SVGGeometry.Radius

    /// A 2D point in SVG coordinate space.
    public typealias Point = SVGGeometry.Point<2>

    /// A 2D displacement vector in SVG coordinate space.
    public typealias Vector = SVGGeometry.Vector<2>

    /// Angle in degrees (for transforms and rotations).
    public typealias Degrees = Degree<Double>
}

// MARK: - Transform

extension W3C_SVG2 {
    /// An affine transformation in SVG coordinate space.
    public typealias Transform = SVGGeometry.Transform
}

// MARK: - Legacy Aliases (for internal use)

extension W3C_SVG2 {
    /// Legacy: SVG space geometry (use SVGGeometry instead)
    @available(*, deprecated, renamed: "SVGGeometry")
    public typealias SVGSpace = SVGGeometry

    /// Legacy: Generic path geometry
    public typealias PathGeometry<Space> = Geometry<Double, Space>.Path
}
