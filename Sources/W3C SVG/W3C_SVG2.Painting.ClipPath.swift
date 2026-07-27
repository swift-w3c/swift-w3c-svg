//
//  W3C_SVG2.Painting.ClipPath.swift
//  swift-w3c-svg
//
//  The 'clipPath' element (SVG 2 Section 14.3)
//

extension W3C_SVG2.Painting {
    /// The 'clipPath' element
    ///
    /// W3C SVG 2 Section 14.3
    /// https://www.w3.org/TR/SVG2/masking.html#ClipPathElement
    ///
    /// The 'clipPath' element defines a clipping path, which restricts the region
    /// to which paint can be applied.
    ///
    /// ## Coordinate System
    ///
    /// - **clipPathUnits**: Defines the coordinate system for the clipping path
    ///
    /// ## Behavior
    ///
    /// Portions of a graphical element that lie outside the clipping path are not rendered.
    /// The clipping path is defined by the child elements of the clipPath.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let clipPath = W3C_SVG2.Painting.ClipPath(id: "myClip")
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Mask``
    public struct ClipPath: SVGElementType, Sendable, Equatable {
        /// Identifier for referencing the clip path
        public let id: String?

        /// Coordinate system for clip path geometry
        ///
        /// Default value: userSpaceOnUse
        public let clipPathUnits: Units?

        /// Creates a clipPath element
        ///
        /// - Parameters:
        ///   - id: Identifier for referencing (default: nil)
        ///   - clipPathUnits: Coordinate system (default: nil, uses userSpaceOnUse)
        public init(
            id: String? = nil,
            clipPathUnits: Units? = nil
        ) {
            self.id = id
            self.clipPathUnits = clipPathUnits
        }
    }
}

extension W3C_SVG2.Painting.ClipPath {
    /// Coordinate system for clip path geometry
    ///
    /// W3C SVG 2 Section 14.3.2
    /// https://www.w3.org/TR/SVG2/masking.html#ClipPathElementClipPathUnitsAttribute
    public enum Units: String, Sendable, Equatable {
        /// Coordinate system established by user space
        case userSpaceOnUse

        /// Coordinate system relative to bounding box (0-1 range)
        case objectBoundingBox
    }

    /// SVG element tag name
    public static let tagName = "clipPath"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
