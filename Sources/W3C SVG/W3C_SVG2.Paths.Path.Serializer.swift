//
//  W3C_SVG2.Paths.Path.Serializer.swift
//  swift-w3c-svg
//
//  Serialize Geometry.Path to SVG path data (SVG 2 Section 9)
//

import Format_Primitives
internal import Geometry_Primitives

extension W3C_SVG2.Paths.Path {
    /// Serializer for converting Geometry.Path to SVG path data strings.
    ///
    /// W3C SVG 2 Section 9.3
    /// https://www.w3.org/TR/SVG2/paths.html#PathData
    ///
    /// ## Example
    ///
    /// ```swift
    /// let d = Path.Serializer.serialize(path)
    /// // Returns: "M100,100 L200,100 L200,200 Z"
    /// ```
    public struct Serializer {}
}

extension W3C_SVG2.Paths.Path.Serializer {
    /// Serialize a Geometry.Path to SVG path data string.
    ///
    /// - Parameter path: The path geometry to serialize
    /// - Returns: SVG path data string (d attribute value)
    public static func serialize(_ path: W3C_SVG2.PathGeometry<W3C_SVG.Space>) -> String {
        var parts: [String] = []

        for subpath in path.subpaths {
            // MoveTo for subpath start
            let startX = subpath.startPoint.x.formatted(.number)
            let startY = subpath.startPoint.y.formatted(.number)
            parts.append("M\(startX),\(startY)")

            // Serialize each segment
            for segment in subpath.segments {
                parts.append(serializeSegment(segment))
            }

            // Close path if needed
            if subpath.isClosed {
                parts.append("Z")
            }
        }

        return parts.joined(separator: " ")
    }

    /// Serialize a single path segment.
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
            // Convert circular arc to beziers for serialization
            // (SVG arcs use endpoint parameterization which is complex to derive)
            let beziers = [W3C_SVG2.Bezier](arc: arc)
            return beziers.map { serializeBezier($0) }.joined(separator: " ")

        case .ellipticalArc(let arc):
            // Serialize as SVG arc command
            return serializeEllipticalArc(arc)
        }
    }

    /// Serialize an elliptical arc to SVG A command.
    ///
    /// Converts from center parameterization back to SVG endpoint parameterization.
    private static func serializeEllipticalArc(
        _ arc: W3C_SVG2.Ellipse.Arc
    ) -> String {
        // Get the endpoint
        let endPoint = arc.endPoint

        // Convert rotation from radians to degrees
        let rotationDegrees = arc.rotation.underlying * 180 / .pi

        // Determine flags from sweep angle
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

    /// Serialize a Bezier curve.
    private static func serializeBezier(_ bezier: W3C_SVG2.Bezier) -> String {
        let points = bezier.controlPoints

        switch points.count {
        case 2:
            // Linear (L command)
            let x = points[1].x.formatted(.number)
            let y = points[1].y.formatted(.number)
            return "L\(x),\(y)"

        case 3:
            // Quadratic (Q command)
            let cx = points[1].x.formatted(.number)
            let cy = points[1].y.formatted(.number)
            let x = points[2].x.formatted(.number)
            let y = points[2].y.formatted(.number)
            return "Q\(cx),\(cy) \(x),\(y)"

        case 4:
            // Cubic (C command)
            let c1x = points[1].x.formatted(.number)
            let c1y = points[1].y.formatted(.number)
            let c2x = points[2].x.formatted(.number)
            let c2y = points[2].y.formatted(.number)
            let x = points[3].x.formatted(.number)
            let y = points[3].y.formatted(.number)
            return "C\(c1x),\(c1y) \(c2x),\(c2y) \(x),\(y)"

        default:
            // Higher-order Bezier: approximate with cubics or output as-is
            // For now, just output control points as cubic segments
            return ""
        }
    }
}
