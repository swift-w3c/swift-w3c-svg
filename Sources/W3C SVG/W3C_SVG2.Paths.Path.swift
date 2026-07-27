//
//  W3C_SVG2.Paths.Path.swift
//  swift-w3c-svg
//
//  The 'path' element (SVG 2 Section 9)
//

import Format_Primitives
public import Geometry_Primitives

extension W3C_SVG2.Paths {
    /// The 'path' element
    ///
    /// W3C SVG 2 Section 9
    /// https://www.w3.org/TR/SVG2/paths.html#PathElement
    ///
    /// The 'path' element defines a shape using SVG path data commands.
    /// Path data consists of moveto, lineto, curveto, arc, and closepath commands.
    ///
    /// ## Path Data
    ///
    /// - **d**: A string containing a series of path commands and parameters
    /// - **geometry**: The underlying `Geometry.Path` from swift-standards
    ///
    /// Path commands:
    /// - M/m: moveto
    /// - L/l: lineto
    /// - H/h: horizontal lineto
    /// - V/v: vertical lineto
    /// - C/c: cubic Bézier curve
    /// - S/s: smooth cubic Bézier curve
    /// - Q/q: quadratic Bézier curve
    /// - T/t: smooth quadratic Bézier curve
    /// - A/a: elliptical arc
    /// - Z/z: closepath
    ///
    /// ## Fill Rule
    ///
    /// - **fillRule**: Determines how the interior of the shape is determined (nonzero or evenodd)
    ///
    /// ## Example
    ///
    /// ```swift
    /// // From path data string
    /// let triangle = W3C_SVG2.Paths.Path(d: "M 100 100 L 300 100 L 200 300 Z")
    ///
    /// // Access geometry
    /// let beziers = triangle.geometry.toBeziers()
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``W3C_SVG2.Shapes``
    /// - ``Command``
    /// - ``Parser``
    /// - ``Serializer``
    public struct Path: SVGElementType, Sendable, Equatable {
        /// The underlying path geometry from swift-standards.
        public var geometry: W3C_SVG2.PathGeometry<W3C_SVG.Space> {
            didSet {
                _originalPathData = nil
            }
        }

        /// The fill rule for determining path interior
        ///
        /// Default value: nonzero
        public var fillRule: W3C_SVG2.Painting.FillRule?

        /// The original path data string, if created from a string.
        /// Invalidated when geometry is modified.
        private var _originalPathData: String?

        /// Creates a path element from a path data string.
        ///
        /// - Parameters:
        ///   - d: The path data string (default: nil)
        ///   - fillRule: The fill rule (default: nil, uses nonzero)
        public init(d: String? = nil, fillRule: W3C_SVG2.Painting.FillRule? = nil) {
            if let d = d {
                self.geometry = Parser.parse(d)
                self._originalPathData = d
            } else {
                self.geometry = .init(subpaths: [])
                self._originalPathData = nil
            }
            self.fillRule = fillRule
        }

        /// Creates a path element from geometry directly.
        ///
        /// - Parameters:
        ///   - geometry: The path geometry
        ///   - fillRule: The fill rule (default: nil, uses nonzero)
        public init(
            geometry: W3C_SVG2.PathGeometry<W3C_SVG.Space>,
            fillRule: W3C_SVG2.Painting.FillRule? = nil
        ) {
            self.geometry = geometry
            self._originalPathData = nil
            self.fillRule = fillRule
        }
    }
}

extension W3C_SVG2.Paths.Path {
    /// The path data string.
    ///
    /// Returns the original string if created from a string and unmodified,
    /// otherwise serializes from geometry.
    public var d: String? {
        if let original = _originalPathData {
            return original
        }
        guard !geometry.isEmpty else { return nil }
        return Serializer.serialize(geometry)
    }

    /// SVG element tag name
    public static let tagName = "path"

    /// Whether this element is self-closing
    public static let isSelfClosing = false
}
