//
//  W3C_SVG2.Types.Transform.Parse.swift
//  swift-w3c-svg
//
//  SVG transform: space-separated list of transform functions
//

public import Parser_Primitives

extension W3C_SVG2.Types.Transform {
    /// Parses an SVG transform attribute value.
    ///
    /// SVG 2 Section 8.4: `<transform-list>` grammar.
    ///
    /// Supported functions:
    /// - `translate(tx [ty])`
    /// - `rotate(angle [cx cy])`
    /// - `scale(sx [sy])`
    /// - `skewX(angle)`
    /// - `skewY(angle)`
    /// - `matrix(a b c d e f)`
    ///
    /// Returns an array of parsed transform functions.
    public struct Parse<Input: Collection.Slice.`Protocol`>: Sendable
    where Input: Sendable, Input.Element == UInt8 {
        @inlinable
        public init() {}
    }
}

public enum __W3C_SVG2TypesTransformParseError: Swift.Error, Sendable, Equatable {
    case expectedFunction
    case expectedOpenParen
    case expectedCloseParen
    case numberError(__W3C_SVG2ParseNumberError)
}

extension W3C_SVG2.Types.Transform.Parse {
    public typealias Error = __W3C_SVG2TypesTransformParseError

    public enum Function: Sendable, Equatable {
        case translate(tx: Double, ty: Double)
        case rotate(angle: Double, cx: Double, cy: Double)
        case scale(sx: Double, sy: Double)
        case skewX(angle: Double)
        case skewY(angle: Double)
        case matrix(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double)
    }

    public typealias Output = [Function]

}

extension W3C_SVG2.Types.Transform.Parse: Parser.`Protocol` {
    public typealias Failure = W3C_SVG2.Types.Transform.Parse<Input>.Error

    @inlinable
    public func parse(_ input: inout Input) throws(Failure) -> Output {
        var functions: [Function] = []

        while true {
            Self._skipWS(&input)
            guard input.startIndex < input.endIndex else { break }

            let byte = input[input.startIndex]
            // Check first character to determine function
            let lower = byte | 0x20
            guard lower >= 0x61 && lower <= 0x7A else { break }

            let fn = try Self._parseFunction(&input)
            functions.append(fn)

            // Skip optional comma between functions
            Self._skipWS(&input)
            if input.startIndex < input.endIndex && input[input.startIndex] == 0x2C {
                input = input[input.index(after: input.startIndex)...]
            }
        }

        return functions
    }

    @inlinable
    static func _parseFunction(_ input: inout Input) throws(Failure) -> Function {
        // Read function name, saving key bytes for dispatch
        var nameLen = 0
        var firstByte: UInt8 = 0
        var fifthByte: UInt8 = 0
        while input.startIndex < input.endIndex {
            let byte = input[input.startIndex] | 0x20
            guard byte >= 0x61 && byte <= 0x7A else { break }
            if nameLen == 0 { firstByte = byte }
            if nameLen == 4 { fifthByte = byte }
            input = input[input.index(after: input.startIndex)...]
            nameLen += 1
        }
        guard nameLen > 0 else { throw .expectedFunction }

        Self._skipWS(&input)

        // Expect '(' (0x28)
        guard input.startIndex < input.endIndex,
            input[input.startIndex] == 0x28
        else {
            throw .expectedOpenParen
        }
        input = input[input.index(after: input.startIndex)...]

        let result: Function

        switch firstByte {
        case 0x74:  // t — translate
            let args = try Self._parseArgs(&input, min: 1, max: 2)
            result = .translate(tx: args[0], ty: args.count > 1 ? args[1] : 0)
        case 0x72:  // r — rotate
            let args = try Self._parseArgs(&input, min: 1, max: 3)
            result = .rotate(
                angle: args[0],
                cx: args.count > 1 ? args[1] : 0,
                cy: args.count > 2 ? args[2] : 0
            )
        case 0x73:  // s — scale or skewX or skewY
            if nameLen == 5 {
                // scale
                let args = try Self._parseArgs(&input, min: 1, max: 2)
                result = .scale(sx: args[0], sy: args.count > 1 ? args[1] : args[0])
            } else {
                // skewX or skewY — disambiguate by 5th byte
                let args = try Self._parseArgs(&input, min: 1, max: 1)
                if fifthByte == 0x78 {  // x
                    result = .skewX(angle: args[0])
                } else {
                    result = .skewY(angle: args[0])
                }
            }
        case 0x6D:  // m — matrix
            let args = try Self._parseArgs(&input, min: 6, max: 6)
            result = .matrix(
                a: args[0],
                b: args[1],
                c: args[2],
                d: args[3],
                e: args[4],
                f: args[5]
            )
        default:
            throw .expectedFunction
        }

        Self._skipWS(&input)
        guard input.startIndex < input.endIndex,
            input[input.startIndex] == 0x29
        else {
            throw .expectedCloseParen
        }
        input = input[input.index(after: input.startIndex)...]

        return result
    }

    @inlinable
    static func _parseArgs(
        _ input: inout Input,
        min: Int,
        max: Int
    ) throws(Failure) -> [Double] {
        var args: [Double] = []

        for i in 0..<max {
            Self._skipWSAndComma(&input)

            // Check if we have more numbers
            guard input.startIndex < input.endIndex else { break }
            let byte = input[input.startIndex]
            let isStart =
                (byte >= 0x30 && byte <= 0x39)
                || byte == 0x2D || byte == 0x2B || byte == 0x2E
            guard isStart else {
                if i >= min { break }
                throw .numberError(.expectedDigit)
            }

            let value: Double
            do throws(W3C_SVG2.Parse.Number<Input>.Failure) {
                value = try W3C_SVG2.Parse.Number<Input>().parse(&input)
            } catch {
                throw .numberError(error)
            }
            args.append(value)
        }

        return args
    }

    @inlinable
    static func _skipWS(_ input: inout Input) {
        while input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            guard byte == 0x20 || byte == 0x09 || byte == 0x0D || byte == 0x0A else { break }
            input = input[input.index(after: input.startIndex)...]
        }
    }

    @inlinable
    static func _skipWSAndComma(_ input: inout Input) {
        Self._skipWS(&input)
        if input.startIndex < input.endIndex && input[input.startIndex] == 0x2C {
            input = input[input.index(after: input.startIndex)...]
        }
        Self._skipWS(&input)
    }
}
