public import W3C

extension W3C.SVG.`2`.Paths.Path.Parser {
    /// Path data that is not well-formed from `offset` on.
    public struct Error: Swift::Error, Sendable, Equatable {
        /// The UTF-8 offset of the first token that does not continue well-formed path data.
        public let offset: Int

        init(offset: Int) {
            self.offset = offset
        }
    }
}
