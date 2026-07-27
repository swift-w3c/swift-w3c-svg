//
//  W3C_SVG2.Scripting.Switch.swift
//  swift-w3c-svg
//
//  The 'switch' element (SVG 2 Section 5.8)
//

extension W3C_SVG2.Scripting {
    /// The 'switch' element
    ///
    /// W3C SVG 2 Section 5.8
    /// https://www.w3.org/TR/SVG2/struct.html#SwitchElement
    ///
    /// The 'switch' element evaluates the `requiredExtensions`, `requiredFeatures`,
    /// and `systemLanguage` attributes on its direct child elements in order, and
    /// renders the first child where these attributes evaluate to true.
    ///
    /// ## Conditional Processing
    ///
    /// Child elements are evaluated in document order.
    /// Only the first child whose testing conditions are satisfied is rendered.
    /// All other children are not rendered or processed.
    ///
    /// ## Testing Attributes
    ///
    /// - **requiredExtensions**: Space-separated list of required extensions
    /// - **requiredFeatures**: Space-separated list of required features (deprecated in SVG 2)
    /// - **systemLanguage**: Space-separated list of language tags (BCP 47)
    ///
    /// ## Behavior
    ///
    /// - If no child's conditions are satisfied, nothing is rendered
    /// - Useful for language-specific content selection
    /// - Useful for feature detection and fallback content
    /// - The switch element itself is never rendered directly
    ///
    /// ## Example
    ///
    /// ```swift
    /// // Language-based content selection
    /// let multiLang = W3C_SVG2.Scripting.Switch()
    /// // Would contain children with systemLanguage="en", systemLanguage="fr", etc.
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``W3C_SVG2.Document.Group``
    public struct Switch: SVGElementType, Sendable, Equatable {
        /// Creates a switch element
        public init() {}
    }
}

extension W3C_SVG2.Scripting.Switch {
    /// SVG element tag name
    public static let tagName = "switch"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
