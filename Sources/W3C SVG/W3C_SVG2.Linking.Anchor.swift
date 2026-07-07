//
//  W3C_SVG2.Linking.Anchor.swift
//  swift-w3c-svg
//
//  The 'a' (anchor) element (SVG 2 Section 16.1)
//

extension W3C_SVG2.Linking {
    /// The 'a' (anchor) element
    ///
    /// W3C SVG 2 Section 16.1
    /// https://www.w3.org/TR/SVG2/linking.html#AElement
    ///
    /// The 'a' element creates a hyperlink to other web pages, files, locations
    /// within the same page, email addresses, or any other URL.
    ///
    /// SVG 2 uses attributes consistent with HTML links and deprecates the
    /// XLink attributes from earlier versions.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let link = W3C_SVG2.Linking.Anchor(
    ///     href: "https://example.com",
    ///     target: "_blank"
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``W3C_SVG2.Document.Group``
    public struct Anchor: SVGElementType, Sendable, Equatable {
        /// The URL that the hyperlink points to.
        ///
        /// Can be any URL scheme supported by browsers.
        public let href: String?

        /// Where to display the linked URL.
        ///
        /// Common values:
        /// - `_self`: Current browsing context (default)
        /// - `_blank`: New tab or window
        /// - `_parent`: Parent browsing context
        /// - `_top`: Top-level browsing context
        public let target: String?

        /// Prompts the user to save the linked URL instead of navigating to it.
        ///
        /// Can specify a default filename.
        public let download: String?

        /// Space-separated URLs to ping when the hyperlink is followed.
        public let ping: String?

        /// The relationship of the linked URL as space-separated link types.
        public let rel: String?

        /// Hints at the human language of the linked URL.
        public let hreflang: String?

        /// Hints at the MIME type of the linked URL.
        public let type: String?

        /// How much referrer information to send when following the link.
        ///
        /// Values: no-referrer, no-referrer-when-downgrade, origin,
        /// origin-when-cross-origin, same-origin, strict-origin,
        /// strict-origin-when-cross-origin, unsafe-url
        public let referrerpolicy: String?

        /// Creates an anchor element.
        ///
        /// - Parameters:
        ///   - href: The URL that the hyperlink points to
        ///   - target: Where to display the linked URL
        ///   - download: Prompts to save instead of navigate
        ///   - ping: URLs to ping when followed
        ///   - rel: Relationship of linked URL
        ///   - hreflang: Language of linked resource
        ///   - type: MIME type of linked resource
        ///   - referrerpolicy: Referrer information policy
        public init(
            href: String? = nil,
            target: String? = nil,
            download: String? = nil,
            ping: String? = nil,
            rel: String? = nil,
            hreflang: String? = nil,
            type: String? = nil,
            referrerpolicy: String? = nil
        ) {
            self.href = href
            self.target = target
            self.download = download
            self.ping = ping
            self.rel = rel
            self.hreflang = hreflang
            self.type = type
            self.referrerpolicy = referrerpolicy
        }
    }
}

extension W3C_SVG2.Linking.Anchor {
    /// SVG element tag name
    public static let tagName = "a"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
