import RFC_3987
public import W3C

extension W3C.SVG.`2`.Paint.LinearGradient {
    public enum Units: String, Sendable, Equatable {

        case userSpaceOnUse

        case objectBoundingBox
    }
}
