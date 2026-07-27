//
//  W3C_SVG2.Parse.Number.swift
//  swift-w3c-svg
//
//  SVG number: [sign] integer [fraction] [exponent]
//

public import Parser_Primitives

extension W3C_SVG2.Parse {
    /// Parses an SVG number value.
    ///
    /// SVG 2 Section 4.1: `<number>` grammar.
    ///
    /// `sign? integer? ("." digit+)? (("e"|"E") sign? digit+)?`
    ///
    /// At least one digit must be present (integer or fractional part).
    ///
    /// Returns the parsed value as a `Double`.
    public struct Number<Input: Collection.Slice.`Protocol`>: Sendable
    where Input: Sendable, Input.Element == UInt8 {
        @inlinable
        public init() {}
    }
}

public enum __W3C_SVG2ParseNumberError: Swift.Error, Sendable, Equatable {
    case expectedDigit
}

extension W3C_SVG2.Parse.Number {
    public typealias Output = Double
    public typealias Error = __W3C_SVG2ParseNumberError
}

extension W3C_SVG2.Parse.Number: Parser.`Protocol` {
    public typealias Failure = W3C_SVG2.Parse.Number<Input>.Error

    @inlinable
    public func parse(_ input: inout Input) throws(Failure) -> Output {
        var negative = false
        var hasDigits = false

        // Optional sign: '+' (0x2B) or '-' (0x2D)
        if input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            if byte == 0x2D {
                negative = true
                input = input[input.index(after: input.startIndex)...]
            } else if byte == 0x2B {
                input = input[input.index(after: input.startIndex)...]
            }
        }

        // Integer part
        var integerPart: Double = 0
        while input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            guard byte >= 0x30 && byte <= 0x39 else { break }
            integerPart = integerPart * 10 + Double(byte &- 0x30)
            input = input[input.index(after: input.startIndex)...]
            hasDigits = true
        }

        // Fractional part: '.' (0x2E)
        var fractionalPart: Double = 0
        if input.startIndex < input.endIndex && input[input.startIndex] == 0x2E {
            input = input[input.index(after: input.startIndex)...]
            var divisor: Double = 10
            while input.startIndex < input.endIndex {
                let byte = input[input.startIndex]
                guard byte >= 0x30 && byte <= 0x39 else { break }
                fractionalPart += Double(byte &- 0x30) / divisor
                divisor *= 10
                input = input[input.index(after: input.startIndex)...]
                hasDigits = true
            }
        }

        guard hasDigits else { throw .expectedDigit }

        var value = integerPart + fractionalPart

        // Exponent: 'e' (0x65) or 'E' (0x45)
        if input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            if byte == 0x65 || byte == 0x45 {
                input = input[input.index(after: input.startIndex)...]

                var expNegative = false
                if input.startIndex < input.endIndex {
                    let s = input[input.startIndex]
                    if s == 0x2D {
                        expNegative = true
                        input = input[input.index(after: input.startIndex)...]
                    } else if s == 0x2B {
                        input = input[input.index(after: input.startIndex)...]
                    }
                }

                var exp = 0
                while input.startIndex < input.endIndex {
                    let d = input[input.startIndex]
                    guard d >= 0x30 && d <= 0x39 else { break }
                    exp = exp &* 10 &+ Int(d &- 0x30)
                    input = input[input.index(after: input.startIndex)...]
                }

                if expNegative {
                    var divisor: Double = 1
                    for _ in 0..<exp { divisor *= 10 }
                    value /= divisor
                } else {
                    var multiplier: Double = 1
                    for _ in 0..<exp { multiplier *= 10 }
                    value *= multiplier
                }
            }
        }

        return negative ? -value : value
    }
}
