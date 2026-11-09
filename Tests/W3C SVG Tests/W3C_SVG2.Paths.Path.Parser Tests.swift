import Testing
import W3C_SVG

enum `W3C_SVG2.Paths.Path.Parser Tests` {}

extension `W3C_SVG2.Paths.Path.Parser Tests` {
    @Suite
    struct `Errors in path data` {
        @Test
        func `well-formed path data parses completely`() throws {
            let commands = try W3C_SVG2.Paths.Path.Parser.parseToCommands("M 0 0 L 10 10 H 20 V 30 Z")
            #expect(commands.count == 5)
        }

        @Test
        func `empty path data has no commands`() throws {
            #expect(try W3C_SVG2.Paths.Path.Parser.parseToCommands("  ").isEmpty)
        }

        @Test
        func `an unreadable token throws its offset`() {
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 14)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("M 0 0 L 10 10 x 5")
            }
        }

        @Test
        func `an unknown command letter throws its offset`() {
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 6)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("M 0 0 X 5 5")
            }
        }

        @Test
        func `an incomplete coordinate pair throws the offset of the pair`() {
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 14)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("M 0 0 L 10 10 20")
            }
        }

        @Test
        func `a command without arguments throws`() {
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 7)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("M 0 0 L")
            }
        }

        @Test
        func `path data must start with a moveto`() {
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 0)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("L 10 10")
            }
        }

        @Test
        func `non-ASCII numerals are not digits`() {
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 2)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("M ٣ 0")
            }
        }

        @Test
        func `a lone sign or dot is not a number`() {
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 6)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("M 0 0 - 1")
            }
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 2)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("M . 0")
            }
        }

        @Test
        func `an exponent marker without digits is not part of the number`() {
            #expect(throws: W3C_SVG2.Paths.Path.Parser.Error(offset: 5)) {
                try W3C_SVG2.Paths.Path.Parser.parseToCommands("M 0 1e")
            }
        }

        @Test
        func `a path element keeps the geometry before the first error`() {
            let path = W3C_SVG2.Paths.Path(d: "M 0 0 L 10 10 x 5")
            #expect(path.geometry.subpaths.count == 1)
            #expect(path.geometry.subpaths.first?.segments.count == 1)
            #expect(path.d == "M 0 0 L 10 10 x 5")
        }
    }
}
