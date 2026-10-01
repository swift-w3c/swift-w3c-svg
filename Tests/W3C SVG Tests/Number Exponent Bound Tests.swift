import Collection
import Index
import Iterator
import Ordinal
import Tagged
import Testing

@testable import W3C_SVG

struct ByteSlice: Sendable {
    let bytes: [UInt8]
    let start: Int
    let end: Int

    init(_ text: String) {
        bytes = Array(text.utf8)
        start = 0
        end = bytes.count
    }

    init(bytes: [UInt8], start: Int, end: Int) {
        self.bytes = bytes
        self.start = start
        self.end = end
    }
}

extension ByteSlice: Collection.`Protocol` {
    typealias Element = UInt8

    var startIndex: Index::Index<UInt8> { Index::Index<UInt8>(_unchecked: Ordinal::Ordinal(UInt(start))) }
    var endIndex: Index::Index<UInt8> { Index::Index<UInt8>(_unchecked: Ordinal::Ordinal(UInt(end))) }

    subscript(_ position: Index::Index<UInt8>) -> UInt8 {
        bytes[Int(bitPattern: position.underlying.rawValue)]
    }

    func index(after i: Index::Index<UInt8>) -> Index::Index<UInt8> {
        i.successor.saturating()
    }

    @_lifetime(borrow self)
    borrowing func makeIterator() -> Iterator::Iterator.Chunk<UInt8> {
        Iterator::Iterator.Chunk(bytes.span.extracting(start..<end))
    }
}

extension ByteSlice: Collection.Slice.`Protocol` {
    subscript(bounds: Range<Index::Index<UInt8>>) -> Self {
        Self(
            bytes: bytes,
            start: Int(bitPattern: bounds.lowerBound.underlying.rawValue),
            end: Int(bitPattern: bounds.upperBound.underlying.rawValue)
        )
    }
}

@Suite
struct `Number and integer bounds` {
    private static func number(_ text: String) throws -> Double {
        var input = ByteSlice(text)
        return try W3C_SVG2.Parse.Number<ByteSlice>().parse(&input)
    }

    @Test
    func `a huge positive exponent is infinity without looping per unit of exponent`() throws {
        #expect(try Self.number("1e999999999999") == .infinity)
    }

    @Test
    func `a huge negative exponent is zero`() throws {
        #expect(try Self.number("1e-999999999999") == 0)
    }

    @Test
    func `an exponent longer than Int is not wrapped into a crash`() throws {
        #expect(try Self.number("1e99999999999999999999999") == .infinity)
    }

    @Test
    func `an ordinary exponent is exact`() throws {
        #expect(try Self.number("1.5e3") == 1500)
        #expect(try Self.number("25e-2") == 0.25)
    }

    @Test
    func `an rgb component longer than Int saturates instead of wrapping`() throws {
        var input = ByteSlice("rgb(99999999999999999999999, 0, 0)")
        let color = try W3C_SVG2.Types.Color.Parse<ByteSlice>().parse(&input)
        guard case .rgb(let r, let g, let b) = color else {
            Issue.record("expected an rgb color, got \(color)")
            return
        }
        #expect(r == Int.max)
        #expect(g == 0 && b == 0)
    }
}
