# swift-w3c-svg

Use this package when you need the SVG 2 element and attribute values as Swift types, or need to read SVG path data, lengths, colors, transforms and view boxes from text. Start from `W3C_SVG2.Document.SVG` for a document, the shapes such as `W3C_SVG2.Circle` and `W3C_SVG2.Rectangle`, and `W3C_SVG2.Paths.Path` for path data. The package doesn't write SVG documents. To build documents with a result builder, use swift-svg. To render them to bytes or strings, use swift-svg-render.

## Laws

- Numbers print in plain decimal with no exponent and no trailing zeros, so 1.0 prints as `1`. An integer or float literal for `W3C_SVG2.Types.Length` is a unitless number.
- `W3C_SVG2.Parse.Number` reads an optional sign, digits with an optional fraction, and an optional exponent. It needs at least one digit. An exponent too large for a `Double` gives infinity, or zero when negative, rather than failing.
- `W3C_SVG2.Types.Length.Parse` reads the unit in any letter case. A percent sign gives a percentage. A missing or unknown unit gives a plain number and leaves the unknown suffix unread.
- `W3C_SVG2.Types.Color.Parse` reads `currentColor` and `none` in any letter case. Any other run of letters is a named color and is not checked against a list. A hex color may have any number of hex digits. An `rgb()` or `rgba()` component is not range-checked, and one too long for `Int` saturates at `Int.max`.
- `W3C_SVG2.Types.Color.hex(_:)` holds the digits without the number sign, and its description adds it.
- `W3C_SVG2.Types.Transform.Parse` reads function names in any letter case, separated by whitespace or a comma. A missing argument takes its default: a translation's y is 0, a rotation's center is 0 0, and a scale's y equals its x.
- `W3C_SVG2.Types.ViewBox.Parse` reads four numbers separated by whitespace, a comma or both. A negative width or height is not refused.
- `W3C_SVG2.Paths.Path.Parser.parse(_:)` never fails. It stops at the first thing it can't read and keeps what it has parsed so far. Relative commands become absolute, extra coordinate pairs after a move become lines, and a smooth curve reflects the previous control point, or uses the current point when there is none.
- A `W3C_SVG2.Paths.Path` made from a `d` string returns that exact string from `W3C_SVG2.Paths.Path.d` until its geometry is changed. After that, and for a path made from geometry, `d` is generated with absolute commands, commas between coordinates, circular arcs as cubic Béziers, and Z for closed subpaths. A path with empty geometry and no source string has no `d`. Two paths with the same geometry but different source strings are not equal.
- `W3C_SVG2.Paths.Path.Command` prints with spaces between coordinates, unlike the generated `d`, which uses commas.
- A polyline made from a points string keeps it as given. One made from coordinates writes x,y pairs separated by spaces.
- The `svg` contexts on circles, rectangles and ellipses give no element for a negative radius or size.
- On a styled shape, `stroked(_:width:)` replaces the whole stroke, so a line cap or join set earlier is dropped.
