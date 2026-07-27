//
//  W3C_SVG2.Types.Color.swift
//  swift-w3c-svg
//
//  SVG color values (SVG 2 Section 4.2)
//

import Format_Primitives

extension W3C_SVG2.Types {
    /// SVG color value
    ///
    /// W3C SVG 2 Section 4.2
    /// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGColor
    ///
    /// Colors can be specified in multiple formats:
    /// - Named colors (e.g., "red", "blue")
    /// - Hexadecimal notation (e.g., "#FF0000")
    /// - RGB functional notation (e.g., "rgb(255, 0, 0)")
    /// - RGBA with alpha channel (e.g., "rgba(255, 0, 0, 0.5)")
    ///
    /// ## Example
    ///
    /// ```swift
    /// let red = W3C_SVG2.Types.Color.named("red")
    /// let hex = W3C_SVG2.Types.Color.hex("FF0000")
    /// let rgb = W3C_SVG2.Types.Color.rgb(r: 255, g: 0, b: 0)
    /// let rgba = W3C_SVG2.Types.Color.rgba(r: 255, g: 0, b: 0, a: 0.5)
    /// let current = W3C_SVG2.Types.Color.currentColor
    /// let none = W3C_SVG2.Types.Color.none
    /// ```
    public enum Color: Sendable, Hashable, CustomStringConvertible {
        /// Named color (e.g., "red", "blue", "green")
        case named(String)

        /// Hexadecimal color (e.g., "FF0000" for red)
        case hex(String)

        /// RGB color with integer values (0-255)
        case rgb(r: Int, g: Int, b: Int)

        /// RGBA color with integer values (0-255) and alpha (0.0-1.0)
        case rgba(r: Int, g: Int, b: Int, a: Double)

        /// The 'currentColor' keyword
        case currentColor

        /// No color (transparent)
        case none
    }
}

extension W3C_SVG2.Types.Color {
    /// String representation for SVG output
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
