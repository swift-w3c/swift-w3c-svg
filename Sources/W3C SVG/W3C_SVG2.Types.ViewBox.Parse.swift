public import Parser_Primitives

extension W3C_SVG2.Types.ViewBox {

    public struct Parse<Input: Collection.Slice.`Protocol`>: Sendable
    where Input: Sendable, Input.Element == UInt8 {
        @inlinable
        public init() {}
    }
}

public enum __W3C_SVG2TypesViewBoxParseError: Swift.Error, Sendable, Equatable {
    case numberError(__W3C_SVG2ParseNumberError)
    case expectedFourNumbers
}

extension W3C_SVG2.Types.ViewBox.Parse {
    public typealias Error = __W3C_SVG2TypesViewBoxParseError

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

extension W3C_SVG2.Types.ViewBox.Parse: Parser.`Protocol` {
    public typealias Failure = W3C_SVG2.Types.ViewBox.Parse<Input>.Error

    @inlinable
    public func parse(_ input: inout Input) throws(Failure) -> Output {
        Self._skipWhitespaceAndComma(&input)

        let minX: Double
        do throws(W3C_SVG2.Parse.Number<Input>.Failure) {
            minX = try W3C_SVG2.Parse.Number<Input>().parse(&input)
        } catch {
            throw .numberError(error)
        }
        Self._skipWhitespaceAndComma(&input)

        let minY: Double
        do throws(W3C_SVG2.Parse.Number<Input>.Failure) {
            minY = try W3C_SVG2.Parse.Number<Input>().parse(&input)
        } catch {
            throw .numberError(error)
        }
        Self._skipWhitespaceAndComma(&input)

        let width: Double
        do throws(W3C_SVG2.Parse.Number<Input>.Failure) {
            width = try W3C_SVG2.Parse.Number<Input>().parse(&input)
        } catch {
            throw .numberError(error)
        }
        Self._skipWhitespaceAndComma(&input)

        let height: Double
        do throws(W3C_SVG2.Parse.Number<Input>.Failure) {
            height = try W3C_SVG2.Parse.Number<Input>().parse(&input)
        } catch {
            throw .numberError(error)
        }

        return Output(minX: minX, minY: minY, width: width, height: height)
    }

    @inlinable
    package static func _skipWhitespaceAndComma(_ input: inout Input) {

        while input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            guard byte == 0x20 || byte == 0x09 || byte == 0x0D || byte == 0x0A else { break }
            input = input[input.index(after: input.startIndex)...]
        }

        if input.startIndex < input.endIndex && input[input.startIndex] == 0x2C {
            input = input[input.index(after: input.startIndex)...]
        }

        while input.startIndex < input.endIndex {
            let byte = input[input.startIndex]
            guard byte == 0x20 || byte == 0x09 || byte == 0x0D || byte == 0x0A else { break }
            input = input[input.index(after: input.startIndex)...]
        }
    }
}
