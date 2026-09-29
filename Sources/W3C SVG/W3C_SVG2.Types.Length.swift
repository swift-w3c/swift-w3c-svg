import Formatter

extension W3C_SVG2.Types {

    public enum Length: Sendable, Equatable, CustomStringConvertible {

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
}

extension W3C_SVG2.Types.Length {

    public var description: String {
        switch self {
        case .number(let value):
            return value.formatted(Formatter.Number())

        case .percentage(let value):
            return value.formatted(Formatter.Number()) + "%"

        case .px(let value):
            return value.formatted(Formatter.Number()) + "px"

        case .em(let value):
            return value.formatted(Formatter.Number()) + "em"

        case .ex(let value):
            return value.formatted(Formatter.Number()) + "ex"

        case .pt(let value):
            return value.formatted(Formatter.Number()) + "pt"

        case .pc(let value):
            return value.formatted(Formatter.Number()) + "pc"

        case .mm(let value):
            return value.formatted(Formatter.Number()) + "mm"

        case .cm(let value):
            return value.formatted(Formatter.Number()) + "cm"

        case .in(let value):
            return value.formatted(Formatter.Number()) + "in"
        }
    }
}

extension W3C_SVG2.Types.Length: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .number(.init(value))
    }
}

extension W3C_SVG2.Types.Length: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .number(.init(value))
    }
}
