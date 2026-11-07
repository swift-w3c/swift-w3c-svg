public import Parser

public enum __W3C_SVG2TypesColorParseError: Swift::Error, Sendable, Equatable {
    case empty
    case invalidHex
    case expectedOpenParen
    case expectedNumber
    case expectedComma
    case expectedCloseParen
}
