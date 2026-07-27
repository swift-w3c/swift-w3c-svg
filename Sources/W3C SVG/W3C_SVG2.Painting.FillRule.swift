//
//  W3C_SVG2.Painting.FillRule.swift
//  swift-w3c-svg
//
//  Fill rule (SVG 2 Section 13.2)
//

extension W3C_SVG2.Painting {
    /// Fill rule
    ///
    /// W3C SVG 2 Section 13.2
    /// https://www.w3.org/TR/SVG2/painting.html#FillRuleProperty
    ///
    /// The `fill-rule` property indicates the algorithm to be used to determine
    /// what parts of the canvas are included inside the shape.
    ///
    /// ## Values
    ///
    /// - **nonzero**: Nonzero winding rule (default)
    /// - **evenodd**: Even-odd winding rule
    ///
    /// ## Winding Rules
    ///
    /// **Nonzero:** Determines whether a point is inside by drawing a ray and
    /// counting path crossings. Non-zero count means inside.
    ///
    /// **Even-odd:** Determines whether a point is inside by drawing a ray and
    /// counting path crossings. Odd count means inside, even count means outside.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let fillRule = W3C_SVG2.Painting.FillRule.evenodd
    /// ```
    public enum FillRule: String, Sendable, Equatable {
        /// Nonzero winding rule (default)
        case nonzero

        /// Even-odd winding rule
        case evenodd
    }
}
