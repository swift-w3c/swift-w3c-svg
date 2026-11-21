import Formatter
public import W3C

extension W3C.SVG.`2`.Types {

    public struct ViewBox: Sendable, Equatable, CustomStringConvertible {

        public let minX: W3C.SVG.`2`.X

        public let minY: W3C.SVG.`2`.Y

        public let width: W3C.SVG.`2`.Width

        public let height: W3C.SVG.`2`.Height

        public init(
            minX: W3C.SVG.`2`.X = .zero,
            minY: W3C.SVG.`2`.Y = .zero,
            width: W3C.SVG.`2`.Width,
            height: W3C.SVG.`2`.Height
        ) {
            self.minX = minX
            self.minY = minY
            self.width = width
            self.height = height
        }
    }
}

extension W3C.SVG.`2`.Types.ViewBox {

    public var description: String {
        "\(minX.formatted(Formatter.Number())) \(minY.formatted(Formatter.Number())) \(width.formatted(Formatter.Number())) \(height.formatted(Formatter.Number()))"
    }
}
