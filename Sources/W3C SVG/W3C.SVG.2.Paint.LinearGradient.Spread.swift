import RFC_3987
public import W3C

extension W3C.SVG.`2`.Paint.LinearGradient {
    public enum Spread: String, Sendable, Equatable {

        case pad

        case reflect

        case `repeat`
    }
}
