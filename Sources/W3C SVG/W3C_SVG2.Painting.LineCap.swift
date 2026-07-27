//
//  W3C_SVG2.Painting.LineCap.swift
//  swift-w3c-svg
//
//  Line cap style (SVG 2 Section 13.3)
//

extension W3C_SVG2.Painting {
    /// Line cap style
    ///
    /// W3C SVG 2 Section 13.3
    /// https://www.w3.org/TR/SVG2/painting.html#LineCaps
    ///
    /// The `stroke-linecap` property specifies the shape to be used at the end
    /// of open subpaths when they are stroked.
    ///
    /// ## Values
    ///
    /// - **butt**: The stroke does not extend beyond the endpoint (default)
    /// - **round**: A rounded end cap with radius equal to half stroke width
    /// - **square**: A square cap extending beyond the endpoint
    ///
    /// ## Example
    ///
    /// ```swift
    /// let lineCap = W3C_SVG2.Painting.LineCap.round
    /// ```
    public enum LineCap: String, Sendable, Equatable {
        /// Stroke does not extend beyond endpoint
        case butt

        /// Rounded end cap
        case round

        /// Square cap extending beyond endpoint
        case square
    }
}
