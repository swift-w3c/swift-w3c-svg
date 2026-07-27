//
//  W3C_SVG2.Ellipse.Arc.swift
//  swift-w3c-svg
//
//  Extensions to Geometry types for SVG-specific initializers.
//

public import Geometry_Primitives

// MARK: - Ellipse.Arc from SVG Arc Command

extension W3C_SVG2.Ellipse.Arc {
    /// Create an elliptical arc from an SVG arc command.
    ///
    /// Converts from SVG endpoint parameterization to center parameterization.
    ///
    /// - Parameters:
    ///   - svgArc: The SVG arc command with endpoint parameterization
    ///   - from: The starting point of the arc
    public init(svgArc: W3C_SVG2.Paths.Path.Command.Arc, from: W3C_SVG2.Point) {
        // Convert degrees to radians for rotation
        let rotationRadians = svgArc.xAxisRotation.radians

        self.init(
            from: from,
            to: svgArc.end,
            rx: W3C_SVG2.SVGGeometry.Length(svgArc.rx),
            ry: W3C_SVG2.SVGGeometry.Length(svgArc.ry),
            xAxisRotation: rotationRadians,
            largeArcFlag: svgArc.largeArcFlag,
            sweepFlag: svgArc.sweepFlag
        )
    }
}
