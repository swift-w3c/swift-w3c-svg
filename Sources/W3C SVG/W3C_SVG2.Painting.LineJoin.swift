//
//  W3C_SVG2.Painting.LineJoin.swift
//  swift-w3c-svg
//
//  Line join style (SVG 2 Section 13.3)
//

extension W3C_SVG2.Painting {
    /// Line join style
    ///
    /// W3C SVG 2 Section 13.3
    /// https://www.w3.org/TR/SVG2/painting.html#LineJoin
    ///
    /// The `stroke-linejoin` property specifies the shape to be used at the
    /// corners of paths or basic shapes when they are stroked.
    ///
    /// ## Values
    ///
    /// - **miter**: Sharp corner with extended outer edges (default)
    /// - **round**: Rounded corner with radius equal to half stroke width
    /// - **bevel**: Flattened corner
    ///
    /// ## Example
    ///
    /// ```swift
    /// let lineJoin = W3C_SVG2.Painting.LineJoin.round
    /// ```
    public enum LineJoin: String, Sendable, Equatable {
        /// Sharp corner with extended edges
        case miter

        /// Rounded corner
        case round

        /// Flattened corner
        case bevel
    }
}
