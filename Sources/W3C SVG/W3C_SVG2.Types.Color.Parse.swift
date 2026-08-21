public import Parser_Primitives

extension W3C_SVG2.Types.Color {

    public struct Parse<Input: Collection.Slice.`Protocol`>: Sendable
    where Input: Sendable, Input.Element == UInt8 {
        @inlinable
        public init() {}
    }
}

public enum __W3C_SVG2TypesColorParseError: Swift.Error, Sendable, Equatable {
    case empty
    case invalidHex
    case expectedOpenParen
    case expectedNumber
    case expectedComma
    case expectedCloseParen
}

extension W3C_SVG2.Types.Color.Parse {
    public typealias Error = __W3C_SVG2TypesColorParseError

    public enum Output: Sendable {
        case hex(Input)
        case rgb(r: Int, g: Int, b: Int)
        case rgba(r: Int, g: Int, b: Int, a: Double)
        case currentColor
        case none
        case named(Input)
    }

}

extension W3C_SVG2.Types.Color.Parse: Parser.`Protocol` {
    public typealias Failure = W3C_SVG2.Types.Color.Parse<Input>.Error

    @inlinable
    public func parse(_ input: inout Input) throws(Failure) -> Output {
        guard input.startIndex < input.endIndex else { throw .empty }

        let first = input[input.startIndex]

        if first == 0x23 {
            input = input[input.index(after: input.startIndex)...]
            let hexStart = input.startIndex
            while input.startIndex < input.endIndex {
                let byte = input[input.startIndex]
                let isHex =
                    (byte >= 0x30 && byte <= 0x39)
                    || (byte >= 0x41 && byte <= 0x46)
                    || (byte >= 0x61 && byte <= 0x66)
                guard isHex else { break }
                input = input[input.index(after: input.startIndex)...]
            }
            guard hexStart < input.startIndex else { throw .invalidHex }
            return .hex(input[hexStart..<input.startIndex])
        }

        if (first | 0x20) == 0x72 {
            return try Self._parseRGBFunction(&input)
        }

        let nameStart = input.startIndex
        while input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            let isAlpha =
                (byte >= 0x41 && byte <= 0x5A)
                || (byte >= 0x61 && byte <= 0x7A)
            guard isAlpha else { break }
            input = input[input.index(after: input.startIndex)...]
        }

        guard nameStart < input.startIndex else { throw .empty }
        let name = input[nameStart..<input.startIndex]

        if Self._isKeyword(
            name,
            0x63,
            0x75,
            0x72,
            0x72,
            0x65,
            0x6E,
            0x74,
            0x63,
            0x6F,
            0x6C,
            0x6F,
            0x72
        ) {
            return .currentColor
        }
        if Self._isKeyword(name, 0x6E, 0x6F, 0x6E, 0x65) {
            return .none
        }

        return .named(name)
    }

    @inlinable
    package static func _isKeyword(_ slice: Input, _ bytes: UInt8...) -> Bool {
        var idx = slice.startIndex
        for expected in bytes {
            guard idx < slice.endIndex else { return false }
            guard (slice[idx] | 0x20) == expected else { return false }
            slice.formIndex(after: &idx)
        }
        return idx == slice.endIndex
    }

    @inlinable
    package static func _parseRGBFunction(_ input: inout Input) throws(Failure) -> Output {

        for expected: UInt8 in [0x72, 0x67, 0x62] {
            guard input.startIndex < input.endIndex else {
                throw .expectedOpenParen
            }
            guard (input[input.startIndex] | 0x20) == expected else {
                throw .expectedOpenParen
            }
            input = input[input.index(after: input.startIndex)...]
        }

        var isRGBA = false
        if input.startIndex < input.endIndex
            && (input[input.startIndex] | 0x20) == 0x61
        {
            isRGBA = true
            input = input[input.index(after: input.startIndex)...]
        }

        Self._skipWS(&input)

        guard input.startIndex < input.endIndex,
            input[input.startIndex] == 0x28
        else {
            throw .expectedOpenParen
        }
        input = input[input.index(after: input.startIndex)...]

        Self._skipWS(&input)
        let r = try Self._parseInt(&input)
        Self._skipWS(&input)
        try Self._expectComma(&input)
        Self._skipWS(&input)
        let g = try Self._parseInt(&input)
        Self._skipWS(&input)
        try Self._expectComma(&input)
        Self._skipWS(&input)
        let b = try Self._parseInt(&input)

        if isRGBA {
            Self._skipWS(&input)
            try Self._expectComma(&input)
            Self._skipWS(&input)

            let a: Double
            do throws(W3C_SVG2.Parse.Number<Input>.Failure) {
                a = try W3C_SVG2.Parse.Number<Input>().parse(&input)
            } catch {
                throw .expectedNumber
            }

            Self._skipWS(&input)
            guard input.startIndex < input.endIndex,
                input[input.startIndex] == 0x29
            else {
                throw .expectedCloseParen
            }
            input = input[input.index(after: input.startIndex)...]

            return .rgba(r: r, g: g, b: b, a: a)
        }

        Self._skipWS(&input)
        guard input.startIndex < input.endIndex,
            input[input.startIndex] == 0x29
        else {
            throw .expectedCloseParen
        }
        input = input[input.index(after: input.startIndex)...]

        return .rgb(r: r, g: g, b: b)
    }

    @inlinable
    package static func _parseInt(_ input: inout Input) throws(Failure) -> Int {
        var value = 0
        var digits = 0
        while input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            guard byte >= 0x30 && byte <= 0x39 else { break }
            value = value &* 10 &+ Int(byte &- 0x30)
            input = input[input.index(after: input.startIndex)...]
            digits += 1
        }
        guard digits > 0 else { throw .expectedNumber }
        return value
    }

    @inlinable
    package static func _expectComma(_ input: inout Input) throws(Failure) {
        guard input.startIndex < input.endIndex,
            input[input.startIndex] == 0x2C
        else {
            throw .expectedComma
        }
        input = input[input.index(after: input.startIndex)...]
    }

    @inlinable
    package static func _skipWS(_ input: inout Input) {
        while input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            guard byte == 0x20 || byte == 0x09 else { break }
            input = input[input.index(after: input.startIndex)...]
        }
    }
}
