//
//  SVGElementType.swift
//  swift-w3c-svg
//
//  Created by Coen ten Thije Boonkkamp
//

/// Protocol that all SVG element types must conform to.
///
/// This protocol defines the basic requirements for SVG elements,
/// allowing for type-safe element construction with specific parameters.
public protocol SVGElementType: Sendable {
    /// The tag name of the SVG element (e.g., "rect", "circle", "path")
    static var tagName: String { get }

    /// Whether this element is self-closing (has no children)
    static var isSelfClosing: Bool { get }
}

extension SVGElementType {
    /// Default implementation - most SVG elements can have children
    public static var isSelfClosing: Bool { false }
}
