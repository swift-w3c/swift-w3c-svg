//
//  W3C_SVG2.Paths.Path.Parser.swift
//  swift-w3c-svg
//
//  SVG path data parser (SVG 2 Section 9)
//

import Foundation
internal import Geometry_Primitives

extension W3C_SVG2.Paths.Path {
    /// Parser for SVG path data strings.
    ///
    /// W3C SVG 2 Section 9.3
    /// https://www.w3.org/TR/SVG2/paths.html#PathData
    ///
    /// Parses SVG path data (the 'd' attribute) into `Geometry.Path`.
    ///
    /// ## Supported Commands
    ///
    /// - M/m: moveto
    /// - L/l: lineto
    /// - H/h: horizontal lineto
    /// - V/v: vertical lineto
    /// - C/c: cubic Bezier curve
    /// - S/s: smooth cubic Bezier curve
    /// - Q/q: quadratic Bezier curve
    /// - T/t: smooth quadratic Bezier curve
    /// - A/a: elliptical arc
    /// - Z/z: closepath
    ///
    /// ## Example
    ///
    /// ```swift
    /// let path = Path.Parser.parse("M 100 100 L 200 100 L 200 200 Z")
    /// // Returns: PathGeometry with one closed subpath
    /// ```
    public struct Parser {
        /// Parse an SVG path data string into a Geometry.Path.
        ///
        /// - Parameter pathData: The path data string (d attribute value)
        /// - Returns: The parsed path geometry
        public static func parse(_ pathData: String) -> W3C_SVG2.PathGeometry<W3C_SVG.Space> {
            var parser = Parser(pathData)
            let commands = parser.parseCommands()
            return convertToGeometry(commands)
        }

        /// Parse an SVG path data string into commands (for serialization).
        ///
        /// - Parameter pathData: The path data string (d attribute value)
        /// - Returns: Array of parsed path commands
        public static func parseToCommands(_ pathData: String) -> [Command] {
            var parser = Parser(pathData)
            return parser.parseCommands()
        }

        /// Convert path commands to Geometry.Path.
        ///
        /// Handles smooth curves (S, T) by computing reflected control points,
        /// and converts SVG elliptical arcs to Bezier curves.
        private static func convertToGeometry(
            _ commands: [Command]
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
                    // Finish previous subpath (open)
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
                    // Second control point for smooth continuation
                    if bezier.controlPoints.count >= 3 {
                        lastControlPoint = bezier.controlPoints[bezier.controlPoints.count - 2]
                    }

                case .smoothCubicBezier(let control2, let end):
                    // Reflect last control point: control1 = current + (current - last)
                    let control1: Point
                    if let last = lastControlPoint {
                        let displacement = currentPoint - last
                        control1 = currentPoint + displacement
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
                    // Reflect last control point
                    let control: Point
                    if let last = lastControlPoint {
                        let displacement = currentPoint - last
                        control = currentPoint + displacement
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
                    // Convert SVG arc command to Geometry.Ellipse.Arc segment
                    let ellipseArc = W3C_SVG2.Ellipse.Arc(
                        svgArc: arcCmd,
                        from: currentPoint
                    )
                    currentSegments.append(.ellipticalArc(ellipseArc))
                    currentPoint = arcCmd.end
                    lastControlPoint = nil

                case .closePath:
                    finishSubpath(closed: true)
                    currentPoint = subpathStart
                    lastControlPoint = nil
                }
            }

            // Finish any remaining open subpath
            finishSubpath(closed: false)

            return W3C_SVG2.PathGeometry<W3C_SVG.Space>(subpaths: subpaths)
        }

        private var input: String
        private var index: String.Index
        private var currentPoint: W3C_SVG2.Point = .init(x: .init(0), y: .init(0))
        private var startPoint: W3C_SVG2.Point = .init(x: .init(0), y: .init(0))
        private var lastControlPoint: W3C_SVG2.Point?

        private init(_ input: String) {
            self.input = input
            self.index = input.startIndex
        }

        private mutating func parseCommands() -> [Command] {
            var commands: [Command] = []

            while index < input.endIndex {
                skipWhitespaceAndCommas()
                guard index < input.endIndex else { break }

                let command = input[index]
                guard command.isLetter else { break }
                index = input.index(after: index)

                let isRelative = command.isLowercase
                let cmd = command.uppercased().first!

                switch cmd {
                case "M":
                    parseMoveTo(isRelative: isRelative, commands: &commands)
                case "L":
                    parseLineTo(isRelative: isRelative, commands: &commands)
                case "H":
                    parseHorizontalLineTo(isRelative: isRelative, commands: &commands)
                case "V":
                    parseVerticalLineTo(isRelative: isRelative, commands: &commands)
                case "C":
                    parseCubicBezier(isRelative: isRelative, commands: &commands)
                case "S":
                    parseSmoothCubicBezier(isRelative: isRelative, commands: &commands)
                case "Q":
                    parseQuadraticBezier(isRelative: isRelative, commands: &commands)
                case "T":
                    parseSmoothQuadraticBezier(isRelative: isRelative, commands: &commands)
                case "A":
                    parseArc(isRelative: isRelative, commands: &commands)
                case "Z":
                    commands.append(.closePath)
                    currentPoint = startPoint
                    lastControlPoint = nil
                default:
                    break
                }
            }

            return commands
        }

        // MARK: - Command Parsers

        private mutating func parseMoveTo(isRelative: Bool, commands: inout [Command]) {
            var isFirst = true
            while let point = parsePoint(isRelative: isRelative) {
                if isFirst {
                    commands.append(.moveTo(point))
                    startPoint = point
                    isFirst = false
                } else {
                    // Subsequent coordinates are implicit lineto
                    commands.append(.lineTo(point))
                }
                currentPoint = point
                lastControlPoint = nil
            }
        }

        private mutating func parseLineTo(isRelative: Bool, commands: inout [Command]) {
            while let point = parsePoint(isRelative: isRelative) {
                commands.append(.lineTo(point))
                currentPoint = point
                lastControlPoint = nil
            }
        }

        private mutating func parseHorizontalLineTo(isRelative: Bool, commands: inout [Command]) {
            while let x = parseNumber() {
                let newX: W3C_SVG2.X =
                    isRelative
                    ? currentPoint.x + W3C_SVG2.Dx(x)
                    : W3C_SVG2.X(x)
                commands.append(.horizontalLineTo(x: newX))
                currentPoint = W3C_SVG2.Point(x: newX, y: currentPoint.y)
                lastControlPoint = nil
            }
        }

        private mutating func parseVerticalLineTo(isRelative: Bool, commands: inout [Command]) {
            while let y = parseNumber() {
                let newY: W3C_SVG2.Y =
                    isRelative
                    ? currentPoint.y + W3C_SVG2.Dy(y)
                    : W3C_SVG2.Y(y)
                commands.append(.verticalLineTo(y: newY))
                currentPoint = W3C_SVG2.Point(x: currentPoint.x, y: newY)
                lastControlPoint = nil
            }
        }

        private mutating func parseCubicBezier(isRelative: Bool, commands: inout [Command]) {
            while let control1 = parsePoint(isRelative: isRelative),
                let control2 = parsePoint(isRelative: isRelative),
                let end = parsePoint(isRelative: isRelative)
            {
                let bezier = W3C_SVG2.Bezier.cubic(
                    from: currentPoint,
                    control1: control1,
                    control2: control2,
                    to: end
                )
                commands.append(.cubicBezier(bezier))
                lastControlPoint = control2
                currentPoint = end
            }
        }

        private mutating func parseSmoothCubicBezier(
            isRelative: Bool,
            commands: inout [Command]
        ) {
            while let control2 = parsePoint(isRelative: isRelative),
                let end = parsePoint(isRelative: isRelative)
            {
                commands.append(.smoothCubicBezier(control2: control2, end: end))
                lastControlPoint = control2
                currentPoint = end
            }
        }

        private mutating func parseQuadraticBezier(isRelative: Bool, commands: inout [Command]) {
            while let control = parsePoint(isRelative: isRelative),
                let end = parsePoint(isRelative: isRelative)
            {
                commands.append(.quadraticBezier(control: control, end: end))
                lastControlPoint = control
                currentPoint = end
            }
        }

        private mutating func parseSmoothQuadraticBezier(
            isRelative: Bool,
            commands: inout [Command]
        ) {
            while let end = parsePoint(isRelative: isRelative) {
                commands.append(.smoothQuadraticBezier(end: end))
                // For smooth quadratic, control is reflection of last control
                // Reflection formula: new = current + (current - last)
                if let last = lastControlPoint {
                    let newX = currentPoint.x + (currentPoint.x - last.x)
                    let newY = currentPoint.y + (currentPoint.y - last.y)
                    lastControlPoint = W3C_SVG2.Point(x: newX, y: newY)
                } else {
                    lastControlPoint = currentPoint
                }
                currentPoint = end
            }
        }

        private mutating func parseArc(isRelative: Bool, commands: inout [Command]) {
            while let rx = parseNumber(),
                let ry = parseNumber(),
                let rotation = parseNumber(),
                let largeArc = parseFlag(),
                let sweep = parseFlag(),
                let end = parsePoint(isRelative: isRelative)
            {
                let arcCmd = Command.Arc(
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
            }
        }

        // MARK: - Primitive Parsers

        private mutating func parsePoint(isRelative: Bool) -> W3C_SVG2.Point? {
            skipWhitespaceAndCommas()
            guard let x = parseNumber(), let y = parseNumber() else { return nil }
            if isRelative {
                // Add displacement to current point
                let displacement = W3C_SVG2.Vector(
                    dx: W3C_SVG2.Dx(x),
                    dy: W3C_SVG2.Dy(y)
                )
                return currentPoint + displacement
            } else {
                return W3C_SVG2.Point(
                    x: W3C_SVG2.X(x),
                    y: W3C_SVG2.Y(y)
                )
            }
        }

        private mutating func parseNumber() -> Double? {
            skipWhitespaceAndCommas()
            guard index < input.endIndex else { return nil }

            let startIdx = index

            // Optional sign
            if index < input.endIndex && (input[index] == "-" || input[index] == "+") {
                index = input.index(after: index)
            }

            // Digits before decimal
            while index < input.endIndex && input[index].isNumber {
                index = input.index(after: index)
            }

            // Decimal point
            if index < input.endIndex && input[index] == "." {
                index = input.index(after: index)
                // Digits after decimal
                while index < input.endIndex && input[index].isNumber {
                    index = input.index(after: index)
                }
            }

            // Exponent
            if index < input.endIndex && (input[index] == "e" || input[index] == "E") {
                index = input.index(after: index)
                // Exponent sign
                if index < input.endIndex && (input[index] == "-" || input[index] == "+") {
                    index = input.index(after: index)
                }
                // Exponent digits
                while index < input.endIndex && input[index].isNumber {
                    index = input.index(after: index)
                }
            }

            guard index > startIdx else { return nil }
            let numberStr = String(input[startIdx..<index])
            return Double(numberStr)
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
                if char == " " || char == "\t" || char == "\n" || char == "\r" || char == "," {
                    index = input.index(after: index)
                } else {
                    break
                }
            }
        }
    }
}
