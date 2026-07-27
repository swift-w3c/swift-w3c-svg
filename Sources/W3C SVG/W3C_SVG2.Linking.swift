//
//  W3C_SVG2.Linking.swift
//  swift-w3c-svg
//
//  Chapter 16: Linking
//

extension W3C_SVG2 {
    /// Chapter 16: Linking
    ///
    /// W3C SVG 2 Chapter 16
    /// https://www.w3.org/TR/SVG2/linking.html
    ///
    /// The Linking namespace contains elements for creating hyperlinks and
    /// references within and between SVG documents.
    ///
    /// ## Overview
    ///
    /// SVG linking supports:
    /// - Hyperlinks to external resources via anchor (a) element
    /// - Fragment identifiers for internal navigation
    /// - View specifications for zooming and panning
    /// - IRI references for resource linking
    ///
    /// ## Elements (To Be Implemented)
    ///
    /// - Anchor (a) element for hyperlinks
    /// - View element for view specifications
    ///
    /// ## Link Properties (To Be Implemented)
    ///
    /// - href: Target URL or IRI
    /// - target: Browsing context
    /// - download: Download hint
    ///
    /// ## View Specifications (To Be Implemented)
    ///
    /// - viewBox for view definition
    /// - preserveAspectRatio for scaling
    /// - zoomAndPan for user interaction
    ///
    /// ## IRI References
    ///
    /// SVG uses IRIs (Internationalized Resource Identifiers) for:
    /// - Paint servers (url(#gradient))
    /// - Clip paths and masks
    /// - Filters and effects
    /// - Text paths and use elements
    ///
    /// ## See Also
    ///
    /// - ``Document``: Document structure (Chapter 5)
    /// - ``Scripting``: Interactivity (Chapter 15)
    public enum Linking {}
}
