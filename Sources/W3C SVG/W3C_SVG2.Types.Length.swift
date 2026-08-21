import Format_Primitives

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
            return value.formatted(.number)

        case .percentage(let value):
            return value.formatted(.number) + "%"

        case .px(let value):
            return value.formatted(.number) + "px"

        case .em(let value):
            return value.formatted(.number) + "em"

        case .ex(let value):
            return value.formatted(.number) + "ex"

        case .pt(let value):
            return value.formatted(.number) + "pt"

        case .pc(let value):
            return value.formatted(.number) + "pc"

        case .mm(let value):
            return value.formatted(.number) + "mm"

        case .cm(let value):
            return value.formatted(.number) + "cm"

        case .in(let value):
            return value.formatted(.number) + "in"
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
