import Formatter
public import Geometry
public import W3C

extension W3C.SVG.`2`.Paths {

    public struct Path: SVGElementType, Sendable, Equatable {

        public var geometry: W3C.SVG.`2`.PathGeometry<W3C.SVG.Space> {
            didSet {
                _originalPathData = nil
            }
        }

        public var fillRule: W3C.SVG.`2`.Painting.FillRule?

        private var _originalPathData: String?

        /// Creates a path from path data, keeping `d` as written.
        ///
        /// As SVG 2 renders path data up to its first error, ``geometry`` holds the commands
        /// before the first error; use ``Parser/parse(_:)`` to detect one.
        public init(d: String? = nil, fillRule: W3C.SVG.`2`.Painting.FillRule? = nil) {
            if let d {
                self.geometry = Parser.parsePrefix(d)
                self._originalPathData = d
            } else {
                self.geometry = .init(subpaths: [])
                self._originalPathData = nil
            }
            self.fillRule = fillRule
        }

        public init(
            geometry: W3C.SVG.`2`.PathGeometry<W3C.SVG.Space>,
            fillRule: W3C.SVG.`2`.Painting.FillRule? = nil
        ) {
            self.geometry = geometry
            self._originalPathData = nil
            self.fillRule = fillRule
        }
    }
}

extension W3C.SVG.`2`.Paths.Path {

    public var d: String? {
        if let original = _originalPathData {
            return original
        }
        guard !geometry.isEmpty else { return nil }
        return Serializer.serialize(geometry)
    }

    public static let tagName = "path"

    public static let isSelfClosing = false
}
