//
//  W3C_SVG2.Painting.Mask.swift
//  swift-w3c-svg
//
//  The 'mask' element (SVG 2 Section 14.4)
//

extension W3C_SVG2.Painting {
    /// The 'mask' element
    ///
    /// W3C SVG 2 Section 14.4
    /// https://www.w3.org/TR/SVG2/masking.html#MaskElement
    ///
    /// The 'mask' element defines an alpha mask for compositing the current object
    /// into the background.
    ///
    /// ## Mask Region
    ///
    /// - **x**: X-coordinate of mask region (default: -10%)
    /// - **y**: Y-coordinate of mask region (default: -10%)
    /// - **width**: Width of mask region (default: 120%)
    /// - **height**: Height of mask region (default: 120%)
    ///
    /// ## Coordinate System
    ///
    /// - **maskUnits**: Defines the coordinate system for x, y, width, height
    ///
    /// ## Behavior
    ///
    /// The mask affects the alpha channel of the masked element. White in the mask
    /// means fully opaque, black means fully transparent, and shades of gray provide
    /// intermediate opacity values.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let mask = W3C_SVG2.Painting.Mask(
    ///     id: "myMask",
    ///     x: 0,
    ///     y: 0,
    ///     width: 100,
    ///     height: 100
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``ClipPath``
    public struct Mask: SVGElementType, Sendable, Equatable {
        /// Identifier for referencing the mask
        public let id: String?

        /// X-coordinate of mask region
        ///
        /// Default value: -10%
        public let x: W3C_SVG2.X?

        /// Y-coordinate of mask region
        ///
        /// Default value: -10%
        public let y: W3C_SVG2.Y?

        /// Width of mask region
        ///
        /// Default value: 120%
        public let width: W3C_SVG2.Width?

        /// Height of mask region
        ///
        /// Default value: 120%
        public let height: W3C_SVG2.Height?

        /// Coordinate system for mask geometry (x, y, width, height)
        ///
        /// Default value: objectBoundingBox
        public let maskUnits: Units?

        /// Coordinate system for mask contents
        ///
        /// Default value: userSpaceOnUse
        public let maskContentUnits: Units?

        /// Creates a mask element
        ///
        /// - Parameters:
        ///   - id: Identifier for referencing (default: nil)
        ///   - x: X-coordinate of mask region (default: nil, uses -10%)
        ///   - y: Y-coordinate of mask region (default: nil, uses -10%)
        ///   - width: Width of mask region (default: nil, uses 120%)
        ///   - height: Height of mask region (default: nil, uses 120%)
        ///   - maskUnits: Coordinate system for geometry (default: nil, uses objectBoundingBox)
        ///   - maskContentUnits: Coordinate system for content (default: nil, uses userSpaceOnUse)
        public init(
            id: String? = nil,
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil,
            maskUnits: Units? = nil,
            maskContentUnits: Units? = nil
        ) {
            self.id = id
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.maskUnits = maskUnits
            self.maskContentUnits = maskContentUnits
        }
    }
}

extension W3C_SVG2.Painting.Mask {
    /// Coordinate system for mask geometry
    ///
    /// W3C SVG 2 Section 14.4.2
    /// https://www.w3.org/TR/SVG2/masking.html#MaskElementMaskUnitsAttribute
    public enum Units: String, Sendable, Equatable {
        /// Coordinate system established by user space
        case userSpaceOnUse

        /// Coordinate system relative to bounding box (0-1 range)
        case objectBoundingBox
    }

    /// SVG element tag name
    public static let tagName = "mask"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
