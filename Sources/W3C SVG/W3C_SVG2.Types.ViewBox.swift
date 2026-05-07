//
//  W3C_SVG2.Types.ViewBox.swift
//  swift-w3c-svg
//
//  SVG viewBox attribute (SVG 2 Section 8.2)
//

import Format_Primitives

extension W3C_SVG2.Types {
    /// SVG viewBox value
    ///
    /// W3C SVG 2 Section 8.2
    /// https://www.w3.org/TR/SVG2/coords.html#ViewBoxAttribute
    ///
    /// The viewBox attribute defines the position and dimension, in user space,
    /// of an SVG viewport.
    ///
    /// The value of the viewBox attribute is a list of four numbers: min-x, min-y,
    /// width and height.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let vb = W3C_SVG2.Types.ViewBox(minX: 0, minY: 0, width: 100, height: 200)
    /// // Outputs: "0 0 100 200"
    /// ```
    public struct ViewBox: Sendable, Equatable, CustomStringConvertible {
        /// The minimum x-coordinate
        public let minX: W3C_SVG2.X

        /// The minimum y-coordinate
        public let minY: W3C_SVG2.Y

        /// The width of the viewport
        public let width: W3C_SVG2.Width

        /// The height of the viewport
        public let height: W3C_SVG2.Height

        /// Creates a viewBox value
        ///
        /// - Parameters:
        ///   - minX: Minimum x-coordinate (default: 0)
        ///   - minY: Minimum y-coordinate (default: 0)
        ///   - width: Width of viewport
        ///   - height: Height of viewport
        public init(
            minX: W3C_SVG2.X = .zero,
            minY: W3C_SVG2.Y = .zero,
            width: W3C_SVG2.Width,
            height: W3C_SVG2.Height
        ) {
            self.minX = minX
            self.minY = minY
            self.width = width
            self.height = height
        }

        /// String representation for SVG output
        public var description: String {
            "\(minX.formatted(.number)) \(minY.formatted(.number)) \(width.formatted(.number)) \(height.formatted(.number))"
        }
    }
}
