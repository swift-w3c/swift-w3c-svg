public import Parser

public enum __W3C_SVG2TypesTransformParseError: Swift::Error, Sendable, Equatable {
    case expectedFunction
    case expectedOpenParen
    case expectedCloseParen
    case numberError(__W3C_SVG2ParseNumberError)
}
