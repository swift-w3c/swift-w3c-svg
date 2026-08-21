import Format_Primitives

extension W3C_SVG2.Types {

    public enum Color: Sendable, Hashable, CustomStringConvertible {

        case named(String)

        case hex(String)

        case rgb(r: Int, g: Int, b: Int)

        case rgba(r: Int, g: Int, b: Int, a: Double)

        case currentColor

        case none
    }
}

extension W3C_SVG2.Types.Color {

    public var description: String {
        switch self {
        case .named(let name):
            return name

        case .hex(let value):
            return "#\(value)"

        case .rgb(let r, let g, let b):
            return "rgb(\(r), \(g), \(b))"

        case .rgba(let r, let g, let b, let a):
            return "rgba(\(r), \(g), \(b), \(a.formatted(.number)))"

        case .currentColor:
            return "currentColor"

        case .none:
            return "none"
        }
    }
}
