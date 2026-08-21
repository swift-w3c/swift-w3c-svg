import Format_Primitives

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
                "translate(\(x.formatted(.number)) \(y.formatted(.number)))"

        case .rotate(let angle, let cx, let cy):
            if let cx, let cy {
                return
                    "rotate(\(angle.formatted(.number)) \(cx.formatted(.number)) \(cy.formatted(.number)))"
            } else {
                return "rotate(\(angle.formatted(.number)))"
            }

        case .scale(let x, let y):
            if let y {
                return "scale(\(x.formatted(.number)) \(y.formatted(.number)))"
            } else {
                return "scale(\(x.formatted(.number)))"
            }

        case .skewX(let angle):
            return "skewX(\(angle.formatted(.number)))"

        case .skewY(let angle):
            return "skewY(\(angle.formatted(.number)))"

        case .matrix(let a, let b, let c, let d, let e, let f):
            return
                "matrix(\(a.formatted(.number)) \(b.formatted(.number)) \(c.formatted(.number)) \(d.formatted(.number)) \(e.formatted(.number)) \(f.formatted(.number)))"
        }
    }
}
