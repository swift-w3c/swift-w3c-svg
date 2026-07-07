//
//  W3C_SVG2.Document.Defs.swift
//  swift-w3c-svg
//
//  The 'defs' element (SVG 2 Section 5.3.1)
//

extension W3C_SVG2.Document {
    /// The 'defs' element
    ///
    /// W3C SVG 2 Section 5.3.1
    /// https://www.w3.org/TR/SVG2/struct.html#DefsElement
    ///
    /// The 'defs' element is a container for storing reusable content.
    /// Elements that are descendants of a 'defs' are not rendered directly.
    ///
    /// ## Characteristics
    ///
    /// - Container element, never-rendered element, structural element
    /// - Content remains in DOM but displays hidden (display: none)
    /// - Children remain fully accessible via URL references
    /// - Recommended placement near document top for clarity
    ///
    /// ## Behavior
    ///
    /// Elements inside defs are not rendered directly but can be referenced by:
    /// - Use elements (href="#id")
    /// - Fill and stroke paint servers
    /// - Clip paths and masks
    /// - Filters and other SVG features
    ///
    /// ## Example
    ///
    /// ```swift
    /// let defs = W3C_SVG2.Document.Defs()
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Symbol``
    /// - ``Use``
    /// - ``Group``
    public struct Defs: SVGElementType, Sendable, Equatable {
        /// Optional identifier for the defs element
        public let id: String?

        /// Creates a defs element
        ///
        /// - Parameters:
        ///   - id: Optional identifier (default: nil)
        public init(
            id: String? = nil
        ) {
            self.id = id
        }
    }
}

extension W3C_SVG2.Document.Defs {
    /// SVG element tag name
    public static let tagName = "defs"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
