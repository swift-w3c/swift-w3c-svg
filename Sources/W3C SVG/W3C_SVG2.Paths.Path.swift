import Format_Primitives
public import Geometry_Primitives

extension W3C_SVG2.Paths {

    public struct Path: SVGElementType, Sendable, Equatable {

        public var geometry: W3C_SVG2.PathGeometry<W3C_SVG.Space> {
            didSet {
                _originalPathData = nil
            }
        }

        public var fillRule: W3C_SVG2.Painting.FillRule?

        private var _originalPathData: String?

        public init(d: String? = nil, fillRule: W3C_SVG2.Painting.FillRule? = nil) {
            if let d {
                self.geometry = Parser.parse(d)
                self._originalPathData = d
            } else {
                self.geometry = .init(subpaths: [])
                self._originalPathData = nil
            }
            self.fillRule = fillRule
        }

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
