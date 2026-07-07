//
//  W3C_SVG2.Document.Group.swift
//  swift-w3c-svg
//
//  The 'g' (group) element (SVG 2 Section 5.2.1)
//

extension W3C_SVG2.Document {
    /// The 'g' (group) element
    ///
    /// W3C SVG 2 Section 5.2.1
    /// https://www.w3.org/TR/SVG2/struct.html#GElement
    ///
    /// The 'g' element is a container element for grouping together related graphics
    /// elements. Groups enable collective transformation, styling, and animation.
    ///
    /// ## Characteristics
    ///
    /// - Container element for grouping related graphics
    /// - Accepts child graphics elements and other containers
    /// - Inherits and applies styles to descendants
    /// - Supports nesting to arbitrary depth
    /// - Can be assigned an id for animation or reference
    ///
    /// ## Common Use Cases
    ///
    /// - Applying transformations to multiple elements
    /// - Grouping for semantic organization
    /// - Collective styling and animation
    /// - Creating reusable components
    ///
    /// ## Example
    ///
    /// ```swift
    /// let group = W3C_SVG2.Document.Group(id: "myGroup")
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``SVG``
    /// - ``Defs``
    public struct Group: SVGElementType, Sendable, Equatable {
        /// Optional identifier for the group
        ///
        /// Used for referencing, animation, or styling
        public let id: String?

        /// Creates a group element
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

extension W3C_SVG2.Document.Group {
    /// SVG element tag name
    public static let tagName = "g"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
