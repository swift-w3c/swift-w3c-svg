import Parser

public enum __W3C_SVG2TypesViewBoxParseError: Swift::Error, Sendable, Equatable {
    case numberError(__W3C_SVG2ParseNumberError)
    case expectedFourNumbers
}
