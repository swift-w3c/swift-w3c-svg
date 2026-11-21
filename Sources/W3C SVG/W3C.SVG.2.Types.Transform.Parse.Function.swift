import Parser
public import W3C

extension W3C.SVG.`2`.Types.Transform.Parse {
    public enum Function: Sendable, Equatable {
        case translate(tx: Double, ty: Double)
        case rotate(angle: Double, cx: Double, cy: Double)
        case scale(sx: Double, sy: Double)
        case skewX(angle: Double)
        case skewY(angle: Double)
        case matrix(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double)
    }
}
