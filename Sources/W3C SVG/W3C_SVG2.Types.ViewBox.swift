import Format_Primitives

extension W3C_SVG2.Types {

    public struct ViewBox: Sendable, Equatable, CustomStringConvertible {

        public let minX: W3C_SVG2.X

        public let minY: W3C_SVG2.Y

        public let width: W3C_SVG2.Width

        public let height: W3C_SVG2.Height

        public init(
            minX: W3C_SVG2.X = .zero,
            minY: W3C_SVG2.Y = .zero,
            width: W3C_SVG2.Width,
            height: W3C_SVG2.Height
        ) {
            self.minX = minX
            self.minY = minY
            self.width = width
            self.height = height
        }
    }
}

extension W3C_SVG2.Types.ViewBox {

    public var description: String {
        "\(minX.formatted(.number)) \(minY.formatted(.number)) \(width.formatted(.number)) \(height.formatted(.number))"
    }
}
