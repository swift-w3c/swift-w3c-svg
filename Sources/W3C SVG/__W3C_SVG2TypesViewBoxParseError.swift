import Parser

public enum __W3C_SVG2TypesViewBoxParseError: Swift::Error, Sendable, Equatable {
    case numberError(__W3C_SVG2ParseNumberError)
    case expectedFourNumbers
    /// The width or height is negative, which SVG 2 makes an error.
    case negativeSize
}
