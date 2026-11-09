internal import Geometry

extension W3C_SVG2.Paths.Path {

    public struct Parser {
        private var input: String
        private var index: String.Index
        private var currentPoint: W3C_SVG2.Point = .init(x: .init(0), y: .init(0))
        private var startPoint: W3C_SVG2.Point = .init(x: .init(0), y: .init(0))
        private var lastControlPoint: W3C_SVG2.Point?

        private init(_ input: String) {
            self.input = input
            self.index = input.startIndex
        }
    }
}

extension W3C_SVG2.Paths.Path.Parser {

    /// Parses path data into geometry.
    ///
    /// Throws ``Error`` with the UTF-8 offset of the first token that does not continue
    /// well-formed path data, so truncated data is never mistaken for complete data.
    public static func parse(
        _ pathData: String
    ) throws(Error) -> W3C_SVG2.PathGeometry<W3C_SVG.Space> {
        convertToGeometry(try parseToCommands(pathData))
    }

    /// Parses path data into commands.
    ///
    /// Throws ``Error`` with the UTF-8 offset of the first token that does not continue
    /// well-formed path data.
    public static func parseToCommands(
        _ pathData: String
    ) throws(Error) -> [W3C_SVG2.Paths.Path.Command] {
        var parser = Self(pathData)
        let result = parser.parseCommands()
        if let error = result.error { throw error }
        return result.commands
    }

    /// The geometry of the commands before the first error, as SVG 2 renders path data
    /// up to the first error.
    static func parsePrefix(_ pathData: String) -> W3C_SVG2.PathGeometry<W3C_SVG.Space> {
        var parser = Self(pathData)
        return convertToGeometry(parser.parseCommands().commands)
    }

    private static func convertToGeometry(
        _ commands: [W3C_SVG2.Paths.Path.Command]
    ) -> W3C_SVG2.PathGeometry<W3C_SVG.Space> {
        typealias Point = W3C_SVG2.Point
        typealias Segment = W3C_SVG2.PathGeometry<W3C_SVG.Space>.Segment
        typealias Subpath = W3C_SVG2.PathGeometry<W3C_SVG.Space>.Subpath

        var subpaths: [Subpath] = []
        var currentSegments: [Segment] = []
        var currentPoint: Point = .init(x: .init(0), y: .init(0))
        var subpathStart: Point = currentPoint
        var lastControlPoint: Point?

        func finishSubpath(closed: Bool) {
            guard !currentSegments.isEmpty || closed else { return }
            subpaths.append(
                Subpath(
                    startPoint: subpathStart,
                    segments: currentSegments,
                    isClosed: closed
                )
            )
            currentSegments = []
        }

        for command in commands {
            switch command {
            case .moveTo(let point):

                finishSubpath(closed: false)
                currentPoint = point
                subpathStart = point
                lastControlPoint = nil

            case .lineTo(let point):
                currentSegments.append(.line(.init(start: currentPoint, end: point)))
                currentPoint = point
                lastControlPoint = nil

            case .horizontalLineTo(let x):
                let point = Point(x: x, y: currentPoint.y)
                currentSegments.append(.line(.init(start: currentPoint, end: point)))
                currentPoint = point
                lastControlPoint = nil

            case .verticalLineTo(let y):
                let point = Point(x: currentPoint.x, y: y)
                currentSegments.append(.line(.init(start: currentPoint, end: point)))
                currentPoint = point
                lastControlPoint = nil

            case .cubicBezier(let bezier):
                currentSegments.append(.bezier(bezier))
                if let end = bezier.endPoint {
                    currentPoint = end
                }

                if bezier.controlPoints.count >= 3 {
                    lastControlPoint = bezier.controlPoints[bezier.controlPoints.count - 2]
                }

            case .smoothCubicBezier(let control2, let end):

                let control1: Point
                if let last = lastControlPoint {
                    let displacement = W3C_SVG2.Point.cartesian.displacement(from: last, to: currentPoint)
                    control1 = currentPoint.translated(by: displacement, using: W3C_SVG2.Point.cartesian)
                } else {
                    control1 = currentPoint
                }
                let bezier = W3C_SVG2.Bezier.cubic(
                    from: currentPoint,
                    control1: control1,
                    control2: control2,
                    to: end
                )
                currentSegments.append(.bezier(bezier))
                lastControlPoint = control2
                currentPoint = end

            case .quadraticBezier(let control, let end):
                let bezier = W3C_SVG2.Bezier.quadratic(
                    from: currentPoint,
                    control: control,
                    to: end
                )
                currentSegments.append(.bezier(bezier))
                lastControlPoint = control
                currentPoint = end

            case .smoothQuadraticBezier(let end):

                let control: Point
                if let last = lastControlPoint {
                    let displacement = W3C_SVG2.Point.cartesian.displacement(from: last, to: currentPoint)
                    control = currentPoint.translated(by: displacement, using: W3C_SVG2.Point.cartesian)
                } else {
                    control = currentPoint
                }
                let bezier = W3C_SVG2.Bezier.quadratic(
                    from: currentPoint,
                    control: control,
                    to: end
                )
                currentSegments.append(.bezier(bezier))
                lastControlPoint = control
                currentPoint = end

            case .arc(let arcCmd):

                currentSegments.append(Segment(svgArc: arcCmd, from: currentPoint))
                currentPoint = arcCmd.end
                lastControlPoint = nil

            case .closePath:
                finishSubpath(closed: true)
                currentPoint = subpathStart
                lastControlPoint = nil
            }
        }

        finishSubpath(closed: false)

        return W3C_SVG2.PathGeometry<W3C_SVG.Space>(subpaths: subpaths)
    }

    private mutating func failure() -> Error {
        skipWhitespaceAndCommas()
        return Error(offset: input.utf8.distance(from: input.startIndex, to: index))
    }

    private mutating func parseCommands() -> (commands: [W3C_SVG2.Paths.Path.Command], error: Error?) {
        var commands: [W3C_SVG2.Paths.Path.Command] = []

        while true {
            skipWhitespaceAndCommas()
            guard index < input.endIndex else { break }

            let commandStart = index
            let command = input[index]
            let isRelative = command.isLowercase
            guard commands.isEmpty == false || command == "M" || command == "m" else {
                return (commands, failure())
            }
            index = input.index(after: index)

            let groups: Int
            switch command {
            case "M", "m":
                groups = parseMoveTo(isRelative: isRelative, commands: &commands)

            case "L", "l":
                groups = parseLineTo(isRelative: isRelative, commands: &commands)

            case "H", "h":
                groups = parseHorizontalLineTo(isRelative: isRelative, commands: &commands)

            case "V", "v":
                groups = parseVerticalLineTo(isRelative: isRelative, commands: &commands)

            case "C", "c":
                groups = parseCubicBezier(isRelative: isRelative, commands: &commands)

            case "S", "s":
                groups = parseSmoothCubicBezier(isRelative: isRelative, commands: &commands)

            case "Q", "q":
                groups = parseQuadraticBezier(isRelative: isRelative, commands: &commands)

            case "T", "t":
                groups = parseSmoothQuadraticBezier(isRelative: isRelative, commands: &commands)

            case "A", "a":
                groups = parseArc(isRelative: isRelative, commands: &commands)

            case "Z", "z":
                commands.append(.closePath)
                currentPoint = startPoint
                lastControlPoint = nil
                groups = 1

            default:
                index = commandStart
                return (commands, failure())
            }

            guard groups > 0 else { return (commands, failure()) }
        }

        return (commands, nil)
    }

    private mutating func parseMoveTo(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while true {
            let groupStart = index
            guard let point = parsePoint(isRelative: isRelative) else {
                index = groupStart
                break
            }
            if groups == 0 {
                commands.append(.moveTo(point))
                startPoint = point
            } else {
                commands.append(.lineTo(point))
            }
            currentPoint = point
            lastControlPoint = nil
            groups += 1
        }
        return groups
    }

    private mutating func parseLineTo(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while true {
            let groupStart = index
            guard let point = parsePoint(isRelative: isRelative) else {
                index = groupStart
                break
            }
            commands.append(.lineTo(point))
            currentPoint = point
            lastControlPoint = nil
            groups += 1
        }
        return groups
    }

    private mutating func parseHorizontalLineTo(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while let x = parseNumber() {
            let newX: W3C_SVG2.X =
                isRelative
                ? currentPoint.x + W3C_SVG2.Dx(x)
                : W3C_SVG2.X(x)
            commands.append(.horizontalLineTo(x: newX))
            currentPoint = W3C_SVG2.Point(x: newX, y: currentPoint.y)
            lastControlPoint = nil
            groups += 1
        }
        return groups
    }

    private mutating func parseVerticalLineTo(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while let y = parseNumber() {
            let newY: W3C_SVG2.Y =
                isRelative
                ? currentPoint.y + W3C_SVG2.Dy(y)
                : W3C_SVG2.Y(y)
            commands.append(.verticalLineTo(y: newY))
            currentPoint = W3C_SVG2.Point(x: currentPoint.x, y: newY)
            lastControlPoint = nil
            groups += 1
        }
        return groups
    }

    private mutating func parseCubicBezier(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while true {
            let groupStart = index
            guard let control1 = parsePoint(isRelative: isRelative),
                let control2 = parsePoint(isRelative: isRelative),
                let end = parsePoint(isRelative: isRelative)
            else {
                index = groupStart
                break
            }
            let bezier = W3C_SVG2.Bezier.cubic(
                from: currentPoint,
                control1: control1,
                control2: control2,
                to: end
            )
            commands.append(.cubicBezier(bezier))
            lastControlPoint = control2
            currentPoint = end
            groups += 1
        }
        return groups
    }

    private mutating func parseSmoothCubicBezier(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while true {
            let groupStart = index
            guard let control2 = parsePoint(isRelative: isRelative),
                let end = parsePoint(isRelative: isRelative)
            else {
                index = groupStart
                break
            }
            commands.append(.smoothCubicBezier(control2: control2, end: end))
            lastControlPoint = control2
            currentPoint = end
            groups += 1
        }
        return groups
    }

    private mutating func parseQuadraticBezier(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while true {
            let groupStart = index
            guard let control = parsePoint(isRelative: isRelative),
                let end = parsePoint(isRelative: isRelative)
            else {
                index = groupStart
                break
            }
            commands.append(.quadraticBezier(control: control, end: end))
            lastControlPoint = control
            currentPoint = end
            groups += 1
        }
        return groups
    }

    private mutating func parseSmoothQuadraticBezier(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while true {
            let groupStart = index
            guard let end = parsePoint(isRelative: isRelative) else {
                index = groupStart
                break
            }
            commands.append(.smoothQuadraticBezier(end: end))

            if let last = lastControlPoint {
                let newX = currentPoint.x + (currentPoint.x - last.x)
                let newY = currentPoint.y + (currentPoint.y - last.y)
                lastControlPoint = W3C_SVG2.Point(x: newX, y: newY)
            } else {
                lastControlPoint = currentPoint
            }
            currentPoint = end
            groups += 1
        }
        return groups
    }

    private mutating func parseArc(
        isRelative: Bool,
        commands: inout [W3C_SVG2.Paths.Path.Command]
    ) -> Int {
        var groups = 0
        while true {
            let groupStart = index
            guard let rx = parseNumber(),
                let ry = parseNumber(),
                let rotation = parseNumber(),
                let largeArc = parseFlag(),
                let sweep = parseFlag(),
                let end = parsePoint(isRelative: isRelative)
            else {
                index = groupStart
                break
            }
            let arcCmd = W3C_SVG2.Paths.Path.Command.Arc(
                rx: rx,
                ry: ry,
                xAxisRotation: Degree(_unchecked: rotation),
                largeArcFlag: largeArc,
                sweepFlag: sweep,
                end: end
            )
            commands.append(.arc(arcCmd))
            currentPoint = end
            lastControlPoint = nil
            groups += 1
        }
        return groups
    }

    private mutating func parsePoint(isRelative: Bool) -> W3C_SVG2.Point? {
        skipWhitespaceAndCommas()
        guard let x = parseNumber(), let y = parseNumber() else { return nil }
        guard isRelative else {
            return W3C_SVG2.Point(
                x: W3C_SVG2.X(x),
                y: W3C_SVG2.Y(y)
            )
        }

        return currentPoint.translated(
            by: Displacement::Displacement(components: .init([x, y])),
            using: W3C_SVG2.Point.cartesian
        )
    }

    private static func isDigit(_ character: Character) -> Bool {
        guard let ascii = character.asciiValue else { return false }
        return ascii >= 0x30 && ascii <= 0x39
    }

    private mutating func skipDigits() -> Bool {
        let digitsStart = index
        while index < input.endIndex && Self.isDigit(input[index]) {
            index = input.index(after: index)
        }
        return index > digitsStart
    }

    private mutating func parseNumber() -> Double? {
        skipWhitespaceAndCommas()
        let startIdx = index

        if index < input.endIndex && (input[index] == "-" || input[index] == "+") {
            index = input.index(after: index)
        }

        var hasDigits = skipDigits()

        if index < input.endIndex && input[index] == "." {
            index = input.index(after: index)
            if skipDigits() { hasDigits = true }
        }

        guard hasDigits else {
            index = startIdx
            return nil
        }

        if index < input.endIndex && (input[index] == "e" || input[index] == "E") {
            let exponentStart = index
            index = input.index(after: index)

            if index < input.endIndex && (input[index] == "-" || input[index] == "+") {
                index = input.index(after: index)
            }

            if skipDigits() == false {
                index = exponentStart
            }
        }

        guard let value = Double(String(input[startIdx..<index])) else {
            index = startIdx
            return nil
        }
        return value
    }

    private mutating func parseFlag() -> Bool? {
        skipWhitespaceAndCommas()
        guard index < input.endIndex else { return nil }
        let char = input[index]
        if char == "0" {
            index = input.index(after: index)
            return false
        } else if char == "1" {
            index = input.index(after: index)
            return true
        }
        return nil
    }

    private mutating func skipWhitespaceAndCommas() {
        while index < input.endIndex {
            let char = input[index]
            guard char == " " || char == "\t" || char == "\n" || char == "\r" || char == "," else {
                break
            }
            index = input.index(after: index)
        }
    }
}
