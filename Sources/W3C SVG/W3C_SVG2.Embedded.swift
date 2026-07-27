//
//  W3C_SVG2.Embedded.swift
//  swift-w3c-svg
//
//  Chapter 12: Embedded Content
//

extension W3C_SVG2 {
    /// Chapter 12: Embedded Content
    ///
    /// W3C SVG 2 Chapter 12
    /// https://www.w3.org/TR/SVG2/embedded.html
    ///
    /// The Embedded namespace contains elements for embedding external content
    /// within SVG documents, including raster images and foreign objects.
    ///
    /// ## Overview
    ///
    /// SVG supports embedding:
    /// - Raster images (PNG, JPEG, etc.) via image element
    /// - Arbitrary XML/HTML content via foreignObject
    /// - Other SVG documents via image or nested svg
    ///
    /// ## Elements (To Be Implemented)
    ///
    /// - Image element for raster images
    /// - ForeignObject element for HTML/XML content
    ///
    /// ## Image Element
    ///
    /// The image element embeds raster images:
    /// - Supports common formats (PNG, JPEG, SVG)
    /// - Position and size via x, y, width, height
    /// - preserveAspectRatio for scaling control
    ///
    /// ## ForeignObject Element
    ///
    /// The foreignObject element embeds non-SVG content:
    /// - HTML elements and CSS styling
    /// - MathML for mathematical notation
    /// - Custom XML namespaces
    ///
    /// ## See Also
    ///
    /// - ``Document``: Document structure (Chapter 5)
    /// - ``Shapes``: Basic shapes (Chapter 10)
    public enum Embedded {}
}
