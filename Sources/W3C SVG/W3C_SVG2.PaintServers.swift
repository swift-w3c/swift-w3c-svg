//
//  W3C_SVG2.PaintServers.swift
//  swift-w3c-svg
//
//  Chapter 14: Paint Servers — Gradients and Patterns
//

extension W3C_SVG2 {
    /// Chapter 14: Paint Servers — Gradients and Patterns
    ///
    /// W3C SVG 2 Chapter 14
    /// https://www.w3.org/TR/SVG2/pservers.html
    ///
    /// Paint servers enable fill and stroke properties to reference reusable
    /// graphical resources for creating complex visual effects like gradients
    /// and patterns.
    ///
    /// ## Paint Server Types
    ///
    /// - **Gradients**: Smooth color transitions
    ///   - ``LinearGradient``: Color transitions along a vector line
    ///   - ``RadialGradient``: Color transitions radiating from focal point
    ///   - ``Stop``: Define color positions within gradients
    ///
    /// - **Patterns**: Tiled graphic elements
    ///   - ``Pattern``: Tile graphics to fill or stroke areas
    ///
    /// ## Usage
    ///
    /// Paint servers are referenced via URL syntax:
    /// ```
    /// fill="url(#MyGradient)"
    /// stroke="url(#MyPattern)"
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Document``: Document structure (Chapter 5)
    /// - ``Shapes``: Basic shapes (Chapter 10)
    public enum PaintServers {}
}
