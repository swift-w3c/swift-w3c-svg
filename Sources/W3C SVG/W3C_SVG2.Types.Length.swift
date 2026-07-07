//
//  W3C_SVG2.Types.Length.swift
//  swift-w3c-svg
//
//  SVG length values (SVG 2 Section 4.1)
//

import Format_Primitives

extension W3C_SVG2.Types {
    /// SVG length value
    ///
    /// W3C SVG 2 Section 4.1
    /// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGLength
    ///
    /// A length is a distance measurement, specified as a number along with a unit.
    /// Lengths are specified in one of two ways:
    /// - A number followed by a unit identifier (e.g., "10px", "5em")
    /// - A percentage value (e.g., "50%")
    ///
    /// ## Unit Identifiers
    ///
    /// - **em**: Font size of the element
    /// - **ex**: x-height of the element's font
    /// - **px**: Pixels (default unit)
    /// - **in**: Inches (1in = 2.54cm)
    /// - **cm**: Centimeters
    /// - **mm**: Millimeters
    /// - **pt**: Points (1pt = 1/72in)
    /// - **pc**: Picas (1pc = 12pt)
    /// - **%**: Percentage of the viewport or parent
    ///
    /// ## Example
    ///
    /// ```swift
    /// let pixels = W3C_SVG2.Types.Length.px(100)       // "100px"
    /// let percent = W3C_SVG2.Types.Length.percentage(50) // "50%"
    /// let ems = W3C_SVG2.Types.Length.em(2.5)          // "2.5em"
    /// ```
    public enum Length: Sendable, Equatable, CustomStringConvertible {
        /// Unitless number
        case number(Double)

        /// Percentage value
        case percentage(Double)

        /// Pixels
        case px(Double)

        /// Em units (font size of element)
        case em(Double)

        /// Ex units (x-height of font)
        case ex(Double)

        /// Points (1pt = 1/72 inch)
        case pt(Double)

        /// Picas (1pc = 12pt)
        case pc(Double)

        /// Millimeters
        case mm(Double)

        /// Centimeters
        case cm(Double)

        /// Inches
        case `in`(Double)
    }
}

extension W3C_SVG2.Types.Length {
    /// String representation for SVG output
    public var description: String {
        switch self {
        case .number(let value):
            return value.formatted(.number)
        case .percentage(let value):
            return value.formatted(.number) + "%"
        case .px(let value):
            return value.formatted(.number) + "px"
        case .em(let value):
            return value.formatted(.number) + "em"
        case .ex(let value):
            return value.formatted(.number) + "ex"
        case .pt(let value):
            return value.formatted(.number) + "pt"
        case .pc(let value):
            return value.formatted(.number) + "pc"
        case .mm(let value):
            return value.formatted(.number) + "mm"
        case .cm(let value):
            return value.formatted(.number) + "cm"
        case .in(let value):
            return value.formatted(.number) + "in"
        }
    }
}

extension W3C_SVG2.Types.Length: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .number(.init(value))
    }
}

extension W3C_SVG2.Types.Length: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .number(.init(value))
    }
}
