//
//  W3C_SVG2.Embedded.ForeignObject.swift
//  swift-w3c-svg
//
//  The 'foreignObject' element (SVG 2 Section 13.7)
//

extension W3C_SVG2.Embedded {
    /// The 'foreignObject' element
    ///
    /// W3C SVG 2 Section 13.7
    /// https://www.w3.org/TR/SVG2/embedded.html#ForeignObjectElement
    ///
    /// The 'foreignObject' element allows for inclusion of elements from a different
    /// XML namespace within SVG content. Typically this is used to embed XHTML content.
    ///
    /// ## Geometry Properties
    ///
    /// - **x**: The x-coordinate of the foreign object (default: 0)
    /// - **y**: The y-coordinate of the foreign object (default: 0)
    /// - **width**: The width of the viewport for foreign content
    /// - **height**: The height of the viewport for foreign content
    ///
    /// ## Behavior
    ///
    /// - Child elements must be from a non-SVG namespace (typically XHTML)
    /// - Content is clipped to the specified width and height
    /// - Useful for embedding HTML form controls, rich text, etc.
    /// - Not all renderers support foreignObject (fallback may be needed)
    ///
    /// ## CSS and Styling
    ///
    /// - Foreign content can use CSS styling
    /// - SVG presentation attributes do not apply to foreign content
    /// - Foreign content inherits computed values from SVG context
    ///
    /// ## Example
    ///
    /// ```swift
    /// let htmlEmbed = W3C_SVG2.Embedded.ForeignObject(
    ///     x: 10,
    ///     y: 10,
    ///     width: 200,
    ///     height: 100
    /// )
    /// // Content would contain XHTML elements
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Image``
    public struct ForeignObject: SVGElementType, Sendable, Equatable {
        /// The x-coordinate of the foreign object
        ///
        /// Default value: 0
        public let x: W3C_SVG2.X?

        /// The y-coordinate of the foreign object
        ///
        /// Default value: 0
        public let y: W3C_SVG2.Y?

        /// The width of the viewport for foreign content
        ///
        /// A negative value is an error.
        public let width: W3C_SVG2.Width?

        /// The height of the viewport for foreign content
        ///
        /// A negative value is an error.
        public let height: W3C_SVG2.Height?

        /// Creates a foreignObject element
        ///
        /// - Parameters:
        ///   - x: The x-coordinate (default: nil, uses 0)
        ///   - y: The y-coordinate (default: nil, uses 0)
        ///   - width: The width (default: nil)
        ///   - height: The height (default: nil)
        public init(
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil
        ) {
            self.x = x
            self.y = y
            self.width = width
            self.height = height
        }
    }
}

extension W3C_SVG2.Embedded.ForeignObject {
    /// SVG element tag name
    public static let tagName = "foreignObject"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
