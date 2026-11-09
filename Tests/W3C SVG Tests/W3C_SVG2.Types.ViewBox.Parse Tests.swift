import Testing

@testable import W3C_SVG

enum `W3C_SVG2.Types.ViewBox.Parse Tests` {}

extension `W3C_SVG2.Types.ViewBox.Parse Tests` {
    @Suite
    struct `View box values` {
        private static func parse(
            _ text: String
        ) throws(W3C_SVG2.Types.ViewBox.Parse<ByteSlice>.Failure) -> W3C_SVG2.Types.ViewBox.Parse<ByteSlice>.Output {
            var input = ByteSlice(text)
            return try W3C_SVG2.Types.ViewBox.Parse<ByteSlice>().parse(&input)
        }

        @Test
        func `four numbers parse with a negative origin`() throws {
            #expect(try Self.parse("-10, -20 100 50") == .init(minX: -10, minY: -20, width: 100, height: 50))
        }

        @Test
        func `a negative width or height is refused`() {
            #expect(throws: W3C_SVG2.Types.ViewBox.Parse<ByteSlice>.Error.negativeSize) {
                try Self.parse("0 0 -100 50")
            }
            #expect(throws: W3C_SVG2.Types.ViewBox.Parse<ByteSlice>.Error.negativeSize) {
                try Self.parse("0 0 100 -50")
            }
        }

        @Test
        func `fewer than four numbers is refused`() {
            #expect(throws: W3C_SVG2.Types.ViewBox.Parse<ByteSlice>.Error.expectedFourNumbers) {
                try Self.parse("0 0 100")
            }
        }
    }
}
