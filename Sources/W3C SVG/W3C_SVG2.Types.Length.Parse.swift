//
//  W3C_SVG2.Types.Length.Parse.swift
//  swift-w3c-svg
//
//  SVG length: number unit?
//

public import Parser_Primitives

extension W3C_SVG2.Types.Length {
    /// Parses an SVG length value.
    ///
    /// SVG 2 Section 4.1: `<length>` grammar.
    ///
    /// `<number> (<unit> | "%")?`
    ///
    /// Supported units: em, ex, px, in, cm, mm, pt, pc, %.
    /// If no unit is present, returns a unitless number.
    public struct Parse<Input: Collection.Slice.`Protocol`>: Sendable
    where Input: Sendable, Input.Element == UInt8 {
        @inlinable
        public init() {}
    }
}

public enum __W3C_SVG2TypesLengthParseError: Swift.Error, Sendable, Equatable {
    case numberError(__W3C_SVG2ParseNumberError)
}

extension W3C_SVG2.Types.Length.Parse {
    public enum Output: Sendable, Equatable {
        case number(Double)
        case percentage(Double)
        case px(Double)
        case em(Double)
        case ex(Double)
        case pt(Double)
        case pc(Double)
        case mm(Double)
        case cm(Double)
        case `in`(Double)
    }

    public typealias Error = __W3C_SVG2TypesLengthParseError
}

extension W3C_SVG2.Types.Length.Parse: Parser.`Protocol` {
    public typealias Failure = W3C_SVG2.Types.Length.Parse<Input>.Error

    @inlinable
    public func parse(_ input: inout Input) throws(Failure) -> Output {
        let value: Double
        do throws(W3C_SVG2.Parse.Number<Input>.Failure) {
            value = try W3C_SVG2.Parse.Number<Input>().parse(&input)
        } catch {
            throw .numberError(error)
        }

        // Check for '%' (0x25)
        if input.startIndex < input.endIndex && input[input.startIndex] == 0x25 {
            input = input[input.index(after: input.startIndex)...]
            return .percentage(value)
        }

        // Check for two-character unit identifiers
        guard input.startIndex < input.endIndex else {
            return .number(value)
        }
        let a = input[input.startIndex]
        var next = input.index(after: input.startIndex)
        guard next < input.endIndex else {
            return .number(value)
        }
        let b = input[next]

        // Match unit (case-insensitive)
        let aLower = a | 0x20
        let bLower = b | 0x20

        let unit: Output
        switch (aLower, bLower) {
        case (0x70, 0x78): unit = .px(value)  // px
        case (0x65, 0x6D): unit = .em(value)  // em
        case (0x65, 0x78): unit = .ex(value)  // ex
        case (0x70, 0x74): unit = .pt(value)  // pt
        case (0x70, 0x63): unit = .pc(value)  // pc
        case (0x6D, 0x6D): unit = .mm(value)  // mm
        case (0x63, 0x6D): unit = .cm(value)  // cm
        case (0x69, 0x6E): unit = .in(value)  // in
        default: return .number(value)
        }

        input.formIndex(after: &next)
        input = input[next...]
        return unit
    }
}
