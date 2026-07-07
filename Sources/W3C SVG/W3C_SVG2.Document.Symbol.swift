//
//  W3C_SVG2.Document.Symbol.swift
//  swift-w3c-svg
//
//  The 'symbol' element (SVG 2 Section 5.5)
//

extension W3C_SVG2.Document {
    /// The 'symbol' element
    ///
    /// W3C SVG 2 Section 5.5
    /// https://www.w3.org/TR/SVG2/struct.html#SymbolElement
    ///
    /// The 'symbol' element defines graphical templates which can be instantiated
    /// by a 'use' element but which are not rendered directly.
    ///
    /// ## Characteristics
    ///
    /// - Never rendered directly (display: none via UA stylesheet)
    /// - Establishes nested coordinate systems
    /// - Defines reusable graphical templates
    /// - Supports viewBox for scalable graphics
    ///
    /// ## New in SVG 2
    ///
    /// - Geometry properties (x, y, width, height) now supported
    /// - refX/refY attributes for alignment
    /// - Overflow property defaults to hidden (automatic clipping)
    ///
    /// ## Geometry Properties
    ///
    /// - **x**: X-coordinate offset (default: 0)
    /// - **y**: Y-coordinate offset (default: 0)
    /// - **width**: Symbol width
    /// - **height**: Symbol height
    ///
    /// ## Viewport Properties
    ///
    /// - **viewBox**: Defines coordinate system for symbol content
    /// - **refX**: Reference x-coordinate for alignment (length or keyword)
    /// - **refY**: Reference y-coordinate for alignment (length or keyword)
    ///
    /// ## Example
    ///
    /// ```swift
    /// let symbol = W3C_SVG2.Document.Symbol(
    ///     id: "icon",
    ///     viewBox: W3C_SVG2.Types.ViewBox(width: 24, height: 24)
    /// )
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Use``
    /// - ``Defs``
    /// - ``SVG``
    public struct Symbol: SVGElementType, Sendable, Equatable {
        /// Identifier for referencing the symbol
        public let id: String?

        /// X-coordinate offset
        ///
        /// Default value: 0
        /// New in SVG 2
        public let x: W3C_SVG2.X?

        /// Y-coordinate offset
        ///
        /// Default value: 0
        /// New in SVG 2
        public let y: W3C_SVG2.Y?

        /// Symbol width
        ///
        /// New in SVG 2
        public let width: W3C_SVG2.Width?

        /// Symbol height
        ///
        /// New in SVG 2
        public let height: W3C_SVG2.Height?

        /// The viewBox defining the coordinate system
        public let viewBox: W3C_SVG2.Types.ViewBox?

        /// Reference X coordinate for alignment
        ///
        /// Can be a length or keyword (left, center, right)
        /// Default value: 0
        public let refX: W3C_SVG2.X?

        /// Reference Y coordinate for alignment
        ///
        /// Can be a length or keyword (top, center, bottom)
        /// Default value: 0
        public let refY: W3C_SVG2.Y?

        /// Controls aspect ratio preservation
        public let preserveAspectRatio: String?

        /// Creates a symbol element
        ///
        /// - Parameters:
        ///   - id: Identifier for referencing (default: nil)
        ///   - x: X-coordinate offset (default: nil, uses 0)
        ///   - y: Y-coordinate offset (default: nil, uses 0)
        ///   - width: Symbol width (default: nil)
        ///   - height: Symbol height (default: nil)
        ///   - viewBox: ViewBox coordinate system (default: nil)
        ///   - refX: Reference X coordinate (default: nil, uses 0)
        ///   - refY: Reference Y coordinate (default: nil, uses 0)
        ///   - preserveAspectRatio: Aspect ratio control (default: nil)
        public init(
            id: String? = nil,
            x: W3C_SVG2.X? = nil,
            y: W3C_SVG2.Y? = nil,
            width: W3C_SVG2.Width? = nil,
            height: W3C_SVG2.Height? = nil,
            viewBox: W3C_SVG2.Types.ViewBox? = nil,
            refX: W3C_SVG2.X? = nil,
            refY: W3C_SVG2.Y? = nil,
            preserveAspectRatio: String? = nil
        ) {
            self.id = id
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self.viewBox = viewBox
            self.refX = refX
            self.refY = refY
            self.preserveAspectRatio = preserveAspectRatio
        }
    }
}

extension W3C_SVG2.Document.Symbol {
    /// SVG element tag name
    public static let tagName = "symbol"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
