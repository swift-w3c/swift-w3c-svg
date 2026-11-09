import Testing

@testable import W3C_SVG

enum `W3C_SVG2.Types.Transform.Parse Tests` {}

extension `W3C_SVG2.Types.Transform.Parse Tests` {
    @Suite
    struct `Function names` {
        private static func parse(
            _ text: String
        ) throws(W3C_SVG2.Types.Transform.Parse<ByteSlice>.Failure) -> [W3C_SVG2.Types.Transform.Parse<ByteSlice>.Function] {
            var input = ByteSlice(text)
            return try W3C_SVG2.Types.Transform.Parse<ByteSlice>().parse(&input)
        }

        @Test
        func `every function is recognized by its full name`() throws {
            #expect(
                try Self.parse("translate(1 2) scale(3) rotate(4 5 6) skewX(7) skewY(8) matrix(1 2 3 4 5 6)") == [
                    .translate(tx: 1, ty: 2),
                    .scale(sx: 3, sy: 3),
                    .rotate(angle: 4, cx: 5, cy: 6),
                    .skewX(angle: 7),
                    .skewY(angle: 8),
                    .matrix(a: 1, b: 2, c: 3, d: 4, e: 5, f: 6),
                ]
            )
        }

        @Test
        func `a name that only shares the first letter is not translate`() {
            #expect(throws: W3C_SVG2.Types.Transform.Parse<ByteSlice>.Error.expectedFunction) {
                try Self.parse("tomato(1)")
            }
        }

        @Test
        func `a five letter name starting with s is not scale`() {
            #expect(throws: W3C_SVG2.Types.Transform.Parse<ByteSlice>.Error.expectedFunction) {
                try Self.parse("sale(2)")
            }
            #expect(throws: W3C_SVG2.Types.Transform.Parse<ByteSlice>.Error.expectedFunction) {
                try Self.parse("sxxxx(2)")
            }
        }

        @Test
        func `a name with a matching prefix is refused`() {
            #expect(throws: W3C_SVG2.Types.Transform.Parse<ByteSlice>.Error.expectedFunction) {
                try Self.parse("skewXY(2)")
            }
            #expect(throws: W3C_SVG2.Types.Transform.Parse<ByteSlice>.Error.expectedFunction) {
                try Self.parse("matrixmatrix(1 2 3 4 5 6)")
            }
        }
    }
}
