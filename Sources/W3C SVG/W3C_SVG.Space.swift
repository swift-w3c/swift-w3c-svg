//
//  W3C_SVG.Space.swift
//  swift-w3c-svg
//
//  SVG coordinate space marker type
//

/// W3C SVG namespace for coordinate space definition.
///
/// This namespace provides the `Space` marker type used to parameterize
/// geometry types for type-safe SVG coordinate handling.
public enum W3C_SVG {}

extension W3C_SVG {
    /// SVG coordinate space marker.
    ///
    /// Used to parameterize `Geometry` types for type-safe SVG coordinates.
    /// This ensures SVG geometry types are distinct from other coordinate systems.
    ///
    /// ## Example
    ///
    /// ```swift
    /// // SVG-specific geometry
    /// typealias SVGGeometry = Geometry<Double, W3C_SVG.Space>
    /// let point: SVGGeometry.Point<2> = ...
    /// ```
    public enum Space {}
}
