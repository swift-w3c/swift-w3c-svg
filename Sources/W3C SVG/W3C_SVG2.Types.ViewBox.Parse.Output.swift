import Parser

extension W3C_SVG2.Types.ViewBox.Parse {
    public struct Output: Sendable, Equatable {
        public let minX: Double
        public let minY: Double
        public let width: Double
        public let height: Double

        @inlinable
        public init(minX: Double, minY: Double, width: Double, height: Double) {
            self.minX = minX
            self.minY = minY
            self.width = width
            self.height = height
        }
    }
}
