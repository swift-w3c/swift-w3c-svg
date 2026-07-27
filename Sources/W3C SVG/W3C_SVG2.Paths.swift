//
//  W3C_SVG2.Paths.swift
//  swift-w3c-svg
//
//  Chapter 9: Paths
//

extension W3C_SVG2 {
    /// Chapter 9: Paths
    ///
    /// W3C SVG 2 Chapter 9
    /// https://www.w3.org/TR/SVG2/paths.html
    ///
    /// The Paths namespace contains the path element and path data specification
    /// for creating complex vector graphics with lines, curves, and arcs.
    ///
    /// ## Overview
    ///
    /// Paths are the most powerful drawing primitive in SVG, enabling:
    /// - Arbitrary line segments (moveto, lineto)
    /// - Cubic and quadratic Bézier curves
    /// - Elliptical arc curves
    /// - Closed subpaths
    ///
    /// ## Elements (To Be Implemented)
    ///
    /// - Path element
    /// - Path data command types (M, L, H, V, C, S, Q, T, A, Z)
    /// - Path data parsing and generation
    ///
    /// ## Path Commands
    ///
    /// - M/m: moveto
    /// - L/l: lineto
    /// - H/h: horizontal lineto
    /// - V/v: vertical lineto
    /// - C/c: cubic Bézier curve
    /// - S/s: smooth cubic Bézier curve
    /// - Q/q: quadratic Bézier curve
    /// - T/t: smooth quadratic Bézier curve
    /// - A/a: elliptical arc
    /// - Z/z: closepath
    ///
    /// ## See Also
    ///
    /// - ``Shapes``: Basic shapes (Chapter 10)
    /// - ``Types``: Basic data types (Chapter 4)
    public enum Paths {}
}
