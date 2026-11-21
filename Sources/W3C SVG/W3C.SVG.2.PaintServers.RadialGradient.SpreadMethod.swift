import RFC_3987
public import W3C

extension W3C.SVG.`2`.PaintServers.RadialGradient {
    public enum SpreadMethod: String, Sendable, Equatable {

        case pad

        case reflect

        case `repeat`
    }
}
