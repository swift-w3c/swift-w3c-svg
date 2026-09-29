import Formatter
internal import Geometry

extension W3C_SVG2.Paths.Path {

    public struct Serializer {}
}

extension W3C_SVG2.Paths.Path.Serializer {

    public static func serialize(_ path: W3C_SVG2.PathGeometry<W3C_SVG.Space>) -> String {
        var parts: [String] = []

        for subpath in path.subpaths {

            let startX = subpath.startPoint.x.formatted(Formatter.Number())
            let startY = subpath.startPoint.y.formatted(Formatter.Number())
            parts.append("M\(startX),\(startY)")

            for segment in subpath.segments {
                parts.append(serializeSegment(segment))
            }

            if subpath.isClosed {
                parts.append("Z")
            }
        }

        return parts.joined(separator: " ")
    }

    private static func serializeSegment(
        _ segment: W3C_SVG2.PathGeometry<W3C_SVG.Space>.Segment
    ) -> String {
        switch segment {
        case .line(let line):
            let x = line.end.x.formatted(Formatter.Number())
            let y = line.end.y.formatted(Formatter.Number())
            return "L\(x),\(y)"

        case .bezier(let bezier):
            return serializeBezier(bezier)

        case .arc(let arc):

            let beziers = [W3C_SVG2.Bezier](arc: arc)
            return beziers.map { serializeBezier($0) }.joined(separator: " ")

        case .ellipticalArc(let arc):

            return serializeEllipticalArc(arc)
        }
    }

    private static func serializeEllipticalArc(
        _ arc: W3C_SVG2.Ellipse.Arc
    ) -> String {

        let endPoint = arc.endPoint

        let rotationDegrees = arc.rotation.underlying * 180 / .pi

        let sweepRaw = arc.sweep.underlying
        let largeArcFlag = abs(sweepRaw) > .pi
        let sweepFlag = sweepRaw > 0

        let rx = arc.semiMajor.formatted(Formatter.Number())
        let ry = arc.semiMinor.formatted(Formatter.Number())
        let rot = rotationDegrees.formatted(Formatter.Number())
        let large = largeArcFlag ? "1" : "0"
        let sweep = sweepFlag ? "1" : "0"
        let x = endPoint.x.formatted(Formatter.Number())
        let y = endPoint.y.formatted(Formatter.Number())

        return "A\(rx),\(ry) \(rot) \(large) \(sweep) \(x),\(y)"
    }

    private static func serializeBezier(_ bezier: W3C_SVG2.Bezier) -> String {
        let points = bezier.controlPoints

        switch points.count {
        case 2:

            let x = points[1].x.formatted(Formatter.Number())
            let y = points[1].y.formatted(Formatter.Number())
            return "L\(x),\(y)"

        case 3:

            let cx = points[1].x.formatted(Formatter.Number())
            let cy = points[1].y.formatted(Formatter.Number())
            let x = points[2].x.formatted(Formatter.Number())
            let y = points[2].y.formatted(Formatter.Number())
            return "Q\(cx),\(cy) \(x),\(y)"

        case 4:

            let c1x = points[1].x.formatted(Formatter.Number())
            let c1y = points[1].y.formatted(Formatter.Number())
            let c2x = points[2].x.formatted(Formatter.Number())
            let c2y = points[2].y.formatted(Formatter.Number())
            let x = points[3].x.formatted(Formatter.Number())
            let y = points[3].y.formatted(Formatter.Number())
            return "C\(c1x),\(c1y) \(c2x),\(c2y) \(x),\(y)"

        default:

            return ""
        }
    }
}
