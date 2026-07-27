//
//  W3C_SVG2.Document.swift
//  swift-w3c-svg
//
//  Chapter 5: Document Structure
//

extension W3C_SVG2 {
    /// Chapter 5: Document Structure
    ///
    /// W3C SVG 2 Chapter 5
    /// https://www.w3.org/TR/SVG2/struct.html
    ///
    /// The Document namespace contains structural elements that define SVG document
    /// composition, including the root SVG element, grouping containers, reusable
    /// definitions, and template elements.
    ///
    /// ## Core Structural Elements
    ///
    /// - ``SVG``: Root element establishing viewport and coordinate system
    /// - ``Group``: Container for grouping related graphics elements
    /// - ``Defs``: Container for reusable content (not rendered directly)
    /// - ``Symbol``: Template definitions instantiated by use elements
    /// - ``Use``: References and renders copies of other elements
    ///
    /// ## See Also
    ///
    /// - ``Types``: Basic data types (Chapter 4)
    /// - ``Shapes``: Basic shapes (Chapter 10)
    public enum Document {}
}
