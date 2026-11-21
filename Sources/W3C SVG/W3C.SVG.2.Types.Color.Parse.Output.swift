import Parser
public import W3C

extension W3C.SVG.`2`.Types.Color.Parse {
    public enum Output: Sendable {
        case hex(Input)
        case rgb(r: Int, g: Int, b: Int)
        case rgba(r: Int, g: Int, b: Int, a: Double)
        case currentColor
        case none
        case named(Input)
    }
}
