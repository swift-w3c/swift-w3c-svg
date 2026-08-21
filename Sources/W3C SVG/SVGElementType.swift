public protocol SVGElementType: Sendable {

    static var tagName: String { get }

    static var isSelfClosing: Bool { get }
}

extension SVGElementType {

    public static var isSelfClosing: Bool { false }
}
