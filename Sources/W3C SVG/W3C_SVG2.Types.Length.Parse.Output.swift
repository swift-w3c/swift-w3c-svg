public import Parser


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
}
