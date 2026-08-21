import Format_Primitives
internal import Geometry_Primitives

extension W3C_SVG2.Paths.Path {

    public struct Serializer {}
}

extension W3C_SVG2.Paths.Path.Serializer {

    public static func serialize(_ path: W3C_SVG2.PathGeometry<W3C_SVG.Space>) -> String {
        var parts: [String] = []

        for subpath in path.subpaths {

            let startX = subpath.startPoint.x.formatted(.number)
            let startY = subpath.startPoint.y.formatted(.number)
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
            let x = line.end.x.formatted(.number)
            let y = line.end.y.formatted(.number)
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

        let rx = arc.semiMajor.formatted(.number)
        let ry = arc.semiMinor.formatted(.number)
        let rot = rotationDegrees.formatted(.number)
        let large = largeArcFlag ? "1" : "0"
        let sweep = sweepFlag ? "1" : "0"
        let x = endPoint.x.formatted(.number)
        let y = endPoint.y.formatted(.number)

        return "A\(rx),\(ry) \(rot) \(large) \(sweep) \(x),\(y)"
    }

    private static func serializeBezier(_ bezier: W3C_SVG2.Bezier) -> String {
        let points = bezier.controlPoints

        switch points.count {
        case 2:

            let x = points[1].x.formatted(.number)
            let y = points[1].y.formatted(.number)
            return "L\(x),\(y)"

        case 3:

            let cx = points[1].x.formatted(.number)
            let cy = points[1].y.formatted(.number)
            let x = points[2].x.formatted(.number)
            let y = points[2].y.formatted(.number)
            return "Q\(cx),\(cy) \(x),\(y)"

        case 4:

            let c1x = points[1].x.formatted(.number)
            let c1y = points[1].y.formatted(.number)
            let c2x = points[2].x.formatted(.number)
            let c2y = points[2].y.formatted(.number)
            let x = points[3].x.formatted(.number)
            let y = points[3].y.formatted(.number)
            return "C\(c1x),\(c1y) \(c2x),\(c2y) \(x),\(y)"

        default:

            return ""
        }
    }
}
