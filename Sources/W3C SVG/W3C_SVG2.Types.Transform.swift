//
//  W3C_SVG2.Types.Transform.swift
//  swift-w3c-svg
//
//  SVG transform functions (SVG 2 Section 8)
//

import Format_Primitives

extension W3C_SVG2.Types {
    /// SVG transform function
    ///
    /// W3C SVG 2 Section 8.4
    /// https://www.w3.org/TR/SVG2/coords.html#TransformProperty
    ///
    /// Transforms modify the coordinate system for an element. Multiple transforms
    /// can be combined by using multiple transform functions.
    ///
    /// ## Transform Functions
    ///
    /// - **translate**: Moves the element
    /// - **rotate**: Rotates the element
    /// - **scale**: Scales the element
    /// - **skewX**: Skews along the x-axis
    /// - **skewY**: Skews along the y-axis
    /// - **matrix**: Direct matrix transformation
    ///
    /// ## Example
    ///
    /// ```swift
    /// let translate = W3C_SVG2.Types.Transform.translate(x: 10, y: 20)
    /// let rotate = W3C_SVG2.Types.Transform.rotate(angle: 45, cx: 50, cy: 50)
    /// let scale = W3C_SVG2.Types.Transform.scale(x: 2, y: 2)
    /// ```
    public enum Transform: Sendable, Equatable, CustomStringConvertible {
        /// Translate by (tx, ty)
        case translate(x: W3C_SVG2.Dx, y: W3C_SVG2.Dy)

        /// Rotate by angle (in degrees), optionally around point (cx, cy)
        case rotate(angle: W3C_SVG2.Degrees, cx: W3C_SVG2.X? = nil, cy: W3C_SVG2.Y? = nil)

        /// Scale by (sx, sy) - dimensionless scale factors
        case scale(x: Double, y: Double? = nil)

        /// Skew along x-axis by angle (in degrees)
        case skewX(angle: W3C_SVG2.Degrees)

        /// Skew along y-axis by angle (in degrees)
        case skewY(angle: W3C_SVG2.Degrees)

        /// Direct matrix transformation (a, b, c, d, e, f)
        case matrix(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double)
    }
}

extension W3C_SVG2.Types.Transform {
    /// String representation for SVG output
    public var description: String {
        switch self {
        case .translate(let x, let y):
            return
                "translate(\(x.formatted(.number)) \(y.formatted(.number)))"
        case .rotate(let angle, let cx, let cy):
            if let cx = cx, let cy = cy {
                return
                    "rotate(\(angle.formatted(.number)) \(cx.formatted(.number)) \(cy.formatted(.number)))"
            } else {
                return "rotate(\(angle.formatted(.number)))"
            }
        case .scale(let x, let y):
            if let y = y {
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
