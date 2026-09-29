import Formatter

extension W3C_SVG2.Types {

    public enum Transform: Sendable, Equatable, CustomStringConvertible {

        case translate(x: W3C_SVG2.Dx, y: W3C_SVG2.Dy)

        case rotate(angle: W3C_SVG2.Degrees, cx: W3C_SVG2.X? = nil, cy: W3C_SVG2.Y? = nil)

        case scale(x: Double, y: Double? = nil)

        case skewX(angle: W3C_SVG2.Degrees)

        case skewY(angle: W3C_SVG2.Degrees)

        case matrix(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double)
    }
}

extension W3C_SVG2.Types.Transform {

    public var description: String {
        switch self {
        case .translate(let x, let y):
            return
                "translate(\(x.formatted(Formatter.Number())) \(y.formatted(Formatter.Number())))"

        case .rotate(let angle, let cx, let cy):
            if let cx, let cy {
                return
                    "rotate(\(angle.formatted(Formatter.Number())) \(cx.formatted(Formatter.Number())) \(cy.formatted(Formatter.Number())))"
            } else {
                return "rotate(\(angle.formatted(Formatter.Number())))"
            }

        case .scale(let x, let y):
            if let y {
                return "scale(\(x.formatted(Formatter.Number())) \(y.formatted(Formatter.Number())))"
            } else {
                return "scale(\(x.formatted(Formatter.Number())))"
            }

        case .skewX(let angle):
            return "skewX(\(angle.formatted(Formatter.Number())))"

        case .skewY(let angle):
            return "skewY(\(angle.formatted(Formatter.Number())))"

        case .matrix(let a, let b, let c, let d, let e, let f):
            return
                "matrix(\(a.formatted(Formatter.Number())) \(b.formatted(Formatter.Number())) \(c.formatted(Formatter.Number())) \(d.formatted(Formatter.Number())) \(e.formatted(Formatter.Number())) \(f.formatted(Formatter.Number())))"
        }
    }
}
