//
//  W3C_SVG2.Embedded.Image.swift
//  swift-w3c-svg
//
//  The 'image' element (SVG 2 Section 13.6)
//

extension W3C_SVG2.Embedded {
    /// The 'image' element
    ///
    /// W3C SVG 2 Section 13.6
    /// https://www.w3.org/TR/SVG2/embedded.html#ImageElement
    ///
    /// The 'image' element indicates that the contents of a complete file are to be
    /// rendered into a given rectangle within the current user coordinate system.
    /// The 'image' element can reference raster image files such as PNG or JPEG,
    /// or other SVG files.
    ///
    /// ## Geometry Properties
    ///
    /// - **x**: The x-coordinate of the image (default: 0)
    /// - **y**: The y-coordinate of the image (default: 0)
    /// - **width**: The width of the image viewport
    /// - **height**: The height of the image viewport
    ///
    /// ## Resource Properties
    ///
    /// - **href**: URL reference to the image file
    /// - **preserveAspectRatio**: Controls scaling and alignment
    ///
    /// ## Behavior
    ///
    /// - If width or height is not specified, the image is not rendered
    /// - Supports common raster formats (PNG, JPEG, GIF, WebP)
    /// - Can embed other SVG documents
    /// - Security restrictions may prevent loading from external origins
    ///
    /// ## Example
    ///
    /// ```swift
    /// let image = W3C_SVG2.Embedded.Image(
    ///     x: 10,
    ///     y: 10,
    ///     width: 100,
    ///     height: 100,
    ///     href: "photo.jpg",
    ///     preserveAspectRatio: "xMidYMid meet"
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``ForeignObject``
    public struct Image: SVGElementType, Sendable, Equatable {
        /// The x-coordinate of the image
        ///
        /// Default value: 0
        public let x: W3C_SVG2.X?

        /// The y-coordinate of the image
        ///
        /// Default value: 0
        public let y: W3C_SVG2.Y?

        /// The width of the image viewport
        ///
        /// A negative value is an error. If not specified or zero, image is not rendered.
        public let width: W3C_SVG2.Width?

        /// The height of the image viewport
        ///
        /// A negative value is an error. If not specified or zero, image is not rendered.
        public let height: W3C_SVG2.Height?

        /// URL reference to the image file
        ///
        /// Can be:
        /// - Relative URL: "images/photo.jpg"
        /// - Absolute URL: "https://example.com/photo.jpg"
        /// - Data URI: "data:image/png;base64,..."
        /// - Fragment identifier: "#svgElementId"
        public let href: String?

        /// Controls how the image is scaled and aligned
        ///
        /// Format: "<align> [<meetOrSlice>]"
        /// Default: "xMidYMid meet"
        public let preserveAspectRatio: String?

        /// Creates an image element
        ///
        /// - Parameters:
        ///   - x: The x-coordinate (default: nil, uses 0)
        ///   - y: The y-coordinate (default: nil, uses 0)
        ///   - width: The width (default: nil)
        ///   - height: The height (default: nil)
        ///   - href: The image URL (default: nil)
        ///   - preserveAspectRatio: Scaling/alignment control (default: nil)
        public init(
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil,
            href: String? = nil,
            preserveAspectRatio: String? = nil
        ) {
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.href = href
            self.preserveAspectRatio = preserveAspectRatio
        }
    }
}

extension W3C_SVG2.Embedded.Image {
    /// SVG element tag name
    public static let tagName = "image"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
