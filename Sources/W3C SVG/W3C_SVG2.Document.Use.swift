//
//  W3C_SVG2.Document.Use.swift
//  swift-w3c-svg
//
//  The 'use' element (SVG 2 Section 5.6)
//

extension W3C_SVG2.Document {
    /// The 'use' element
    ///
    /// W3C SVG 2 Section 5.6
    /// https://www.w3.org/TR/SVG2/struct.html#UseElement
    ///
    /// The 'use' element references another element, a copy of which is rendered
    /// in place of the 'use'. It creates a shadow tree containing cloned instances.
    ///
    /// ## Critical Attributes
    ///
    /// - **href**: URL reference to target element
    /// - **x**: Apply translate transformation (repositions content)
    /// - **y**: Apply translate transformation (repositions content)
    /// - **width**: Override viewport dimensions on referenced svg/symbol
    /// - **height**: Override viewport dimensions on referenced svg/symbol
    ///
    /// ## Shadow Tree Behavior
    ///
    /// - Read-only; modification attempts throw NoModificationAllowedError
    /// - Script elements within shadow trees are inert
    /// - Mutations in source elements automatically reflect in shadow tree
    /// - Circular references invalidate the use element
    ///
    /// ## Layout Details
    ///
    /// The x and y properties define an additional transformation:
    /// translate(x,y) appended to the right-side of the transformation list.
    ///
    /// ## New in SVG 2
    ///
    /// - href can reference document root (fragments optional)
    /// - Enhanced shadow tree behavior
    ///
    /// ## Example
    ///
    /// ```swift
    /// let use = W3C_SVG2.Document.Use(
    ///     href: "#icon",
    ///     x: 50,
    ///     y: 50
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Symbol``
    /// - ``Defs``
    /// - ``Group``
    public struct Use: SVGElementType, Sendable, Equatable {
        /// URL reference to target element
        ///
        /// Format: "#elementId" for same-document references
        /// or full URL for external references
        public let href: String?

        /// X-coordinate offset (applies translate transformation)
        ///
        /// Default value: 0
        public let x: W3C_SVG2.X?

        /// Y-coordinate offset (applies translate transformation)
        ///
        /// Default value: 0
        public let y: W3C_SVG2.Y?

        /// Override width for referenced svg/symbol viewport
        public let width: W3C_SVG2.Width?

        /// Override height for referenced svg/symbol viewport
        public let height: W3C_SVG2.Height?

        /// Creates a use element
        ///
        /// - Parameters:
        ///   - href: URL reference to target (default: nil)
        ///   - x: X-coordinate offset (default: nil, uses 0)
        ///   - y: Y-coordinate offset (default: nil, uses 0)
        ///   - width: Viewport width override (default: nil)
        ///   - height: Viewport height override (default: nil)
        public init(
            href: String? = nil,
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil
        ) {
            self.href = href
            self.x = x
            self.y = y
            self.width = width
            self.height = height
        }
    }
}

extension W3C_SVG2.Document.Use {
    /// SVG element tag name
    public static let tagName = "use"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
