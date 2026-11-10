import Testing

@testable import W3C_SVG

enum `W3C_SVG2.Types.Color.Parse Tests` {}

extension `W3C_SVG2.Types.Color.Parse Tests` {
    @Suite
    struct `Hex and rgb colors` {
        private static func parse(
            _ text: String
        ) throws(W3C_SVG2.Types.Color.Parse<ByteSlice>.Failure) -> W3C_SVG2.Types.Color.Parse<ByteSlice>.Output {
            var input = ByteSlice(text)
            return try W3C_SVG2.Types.Color.Parse<ByteSlice>().parse(&input)
        }

        @Test
        func `hex colors of 3, 4, 6 and 8 digits are accepted`() throws {
            for text in ["#abc", "#abcd", "#aabbcc", "#aabbccdd"] {
                guard case .hex(let digits) = try Self.parse(text) else {
                    Issue.record("expected a hex color for \(text)")
                    continue
                }
                #expect(digits.end - digits.start == text.utf8.dropFirst().count)
            }
        }

        @Test
        func `hex colors of other lengths are refused`() {
            for text in ["#", "#a", "#ab", "#abcde", "#abcdeff", "#aabbccddee"] {
                #expect(throws: W3C_SVG2.Types.Color.Parse<ByteSlice>.Error.invalidHex) {
                    try Self.parse(text)
                }
            }
        }

        @Test
        func `out-of-range rgb components are clamped`() throws {
            guard case .rgb(let r, let g, let b) = try Self.parse("rgb(300, 255, 0)") else {
                Issue.record("expected an rgb color")
                return
            }
            #expect(r == 255 && g == 255 && b == 0)
        }

        @Test
        func `out-of-range alpha is clamped to 0 through 1`() throws {
            guard case .rgba(_, _, _, let high) = try Self.parse("rgba(0, 0, 0, 2.5)") else {
                Issue.record("expected an rgba color")
                return
            }
            #expect(high == 1)
            guard case .rgba(_, _, _, let low) = try Self.parse("rgba(0, 0, 0, -1)") else {
                Issue.record("expected an rgba color")
                return
            }
            #expect(low == 0)
        }
    }
}
