//
//  W3C_SVG2.Shapes.swift
//  swift-w3c-svg
//
//  Chapter 10: Basic Shapes
//

extension W3C_SVG2 {
    /// Chapter 10: Basic Shapes
    ///
    /// W3C SVG 2 Section 10
    /// https://www.w3.org/TR/SVG2/shapes.html
    ///
    /// SVG contains the following set of basic shape elements:
    /// - Rectangles (rect)
    /// - Circles (circle)
    /// - Ellipses (ellipse)
    /// - Straight lines (line)
    /// - Polylines (polyline)
    /// - Polygons (polygon)
    ///
    /// Mathematically, these shape elements are equivalent to a 'path' element that would
    /// construct the same shape. The basic shapes may be stroked, filled and used as clip paths.
    ///
    /// ## Implemented Elements
    ///
    /// - ``Rectangle`` - The 'rect' element
    /// - ``Circle`` - The 'circle' element
    /// - ``Ellipse`` - The 'ellipse' element
    /// - ``Line`` - The 'line' element
    /// - ``Polyline`` - The 'polyline' element
    /// - ``Polygon`` - The 'polygon' element
    ///
    /// ## See Also
    ///
    /// - ``Rectangle``
    /// - ``Circle``
    /// - ``Ellipse``
    public enum Shapes {}
}
