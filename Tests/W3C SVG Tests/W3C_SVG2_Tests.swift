//
//  W3C_SVG2_Tests.swift
//  swift-w3c-svg
//
//  Tests for W3C SVG 2 implementation
//

// import InlineSnapshotTesting
import Testing
import W3C_SVG

@Suite("W3C SVG2 - Basic Functionality")
struct W3C_SVG2_Tests {

    @Suite("Types - Length")
    struct LengthTests {
        //         @Test("Length pixels")
        //         func lengthPixels() {
        //             let length = W3C_SVG2.Types.Length.px(100)
        //             assertInlineSnapshot(of: length.description, as: .lines) {
        //                 """
        //                 100px
        //                 """
        //             }
        //         }

        //         @Test("Length percentage")
        //         func lengthPercentage() {
        //             let length = W3C_SVG2.Types.Length.percentage(50)
        //             assertInlineSnapshot(of: length.description, as: .lines) {
        //                 """
        //                 50%
        //                 """
        //             }
        //         }

        //         @Test("Length em")
        //         func lengthEm() {
        //             let length = W3C_SVG2.Types.Length.em(2.5)
        //             assertInlineSnapshot(of: length.description, as: .lines) {
        //                 """
        //                 2.5em
        //                 """
        //             }
        //         }

        //         @Test("Length formatted")
        //         func lengthFormatted() {
        //             let length1: W3C_SVG2.Types.Length = 1
        //             assertInlineSnapshot(of: length1.description, as: .lines) {
        //                 """
        //                 1
        //                 """
        //             }
        //         }
    }

    @Suite("Types - Color")
    struct ColorTests {
        //         @Test("Color named")
        //         func colorNamed() {
        //             let color = W3C_SVG2.Types.Color.named("red")
        //             assertInlineSnapshot(of: color.description, as: .lines) {
        //                 """
        //                 red
        //                 """
        //             }
        //         }

        //         @Test("Color hex")
        //         func colorHex() {
        //             let color = W3C_SVG2.Types.Color.hex("FF0000")
        //             assertInlineSnapshot(of: color.description, as: .lines) {
        //                 """
        //                 #FF0000
        //                 """
        //             }
        //         }

        //         @Test("Color RGB")
        //         func colorRGB() {
        //             let color = W3C_SVG2.Types.Color.rgb(r: 255, g: 0, b: 0)
        //             assertInlineSnapshot(of: color.description, as: .lines) {
        //                 """
        //                 rgb(255, 0, 0)
        //                 """
        //             }
        //         }
    }

    @Suite("Types - Transform")
    struct TransformTests {
        //         @Test("Transform translate")
        //         func transformTranslate() {
        //             let transform = W3C_SVG2.Types.Transform.translate(x: 10, y: 20)
        //             assertInlineSnapshot(of: transform.description, as: .lines) {
        //                 """
        //                 translate(10 20)
        //                 """
        //             }
        //         }

        //         @Test("Transform rotate")
        //         func transformRotate() {
        //             let transform = W3C_SVG2.Types.Transform.rotate(angle: 45)
        //             assertInlineSnapshot(of: transform.description, as: .lines) {
        //                 """
        //                 rotate(45)
        //                 """
        //             }
        //         }

        //         @Test("Transform scale")
        //         func transformScale() {
        //             let transform = W3C_SVG2.Types.Transform.scale(x: 2, y: 3)
        //             assertInlineSnapshot(of: transform.description, as: .lines) {
        //                 """
        //                 scale(2 3)
        //                 """
        //             }
        //         }
    }

    @Suite("Types - ViewBox")
    struct ViewBoxTests {
        //         @Test("ViewBox creation")
        //         func viewBoxCreation() {
        //             let vb = W3C_SVG2.Types.ViewBox(width: 100, height: 200)
        //             assertInlineSnapshot(of: vb.description, as: .lines) {
        //                 """
        //                 0 0 100 200
        //                 """
        //             }
        //         }

        //         @Test("ViewBox with offset")
        //         func viewBoxWithOffset() {
        //             let vb = W3C_SVG2.Types.ViewBox(minX: 10, minY: 20, width: 100, height: 200)
        //             assertInlineSnapshot(of: vb.description, as: .lines) {
        //                 """
        //                 10 20 100 200
        //                 """
        //             }
        //         }
    }

    @Suite("Shapes - Circle")
    struct CircleTests {
        @Test
        func `Circle creation`() {
            let circle = W3C_SVG2.Shapes.Circle(cx: 50, cy: 50, r: 40)
            #expect(circle.cx == 50)
            #expect(circle.cy == 50)
            #expect(circle.r == 40)
        }

        @Test
        func `Circle tag name`() {
            #expect(W3C_SVG2.Shapes.Circle.tagName == "circle")
        }
    }

    @Suite("Shapes - Rectangle")
    struct RectangleTests {
        @Test
        func `Rectangle creation`() {
            let rect = W3C_SVG2.Shapes.Rectangle(x: 10, y: 10, width: 100, height: 80)
            #expect(rect.x == 10)
            #expect(rect.y == 10)
            #expect(rect.width == 100)
            #expect(rect.height == 80)
        }

    }

    @Suite("Shapes - Ellipse")
    struct EllipseTests {
        @Test
        func `Ellipse creation`() {
            let ellipse = W3C_SVG2.Shapes.Ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
            #expect(ellipse.cx == 100)
            #expect(ellipse.cy == 50)
            #expect(ellipse.rx == 80)
            #expect(ellipse.ry == 40)
        }
    }

    @Suite("Shapes - Line")
    struct LineTests {
        @Test
        func `Line creation`() {
            let line = W3C_SVG2.Shapes.Line(x1: 0, y1: 0, x2: 100, y2: 100)
            #expect(line.x1 == 0)
            #expect(line.y1 == 0)
            #expect(line.x2 == 100)
            #expect(line.y2 == 100)
        }
    }

    @Suite("Shapes - Polyline")
    struct PolylineTests {
        @Test
        func `Polyline creation`() {
            let polyline = W3C_SVG2.Shapes.Polyline(points: "0,0 50,50 100,0")
            #expect(polyline.points == "0,0 50,50 100,0")
        }

        @Test
        func `Polyline tag name`() {
            #expect(W3C_SVG2.Shapes.Polyline.tagName == "polyline")
        }

        @Test
        func `Polyline with space-separated points`() {
            let polyline = W3C_SVG2.Shapes.Polyline(points: "0 0 50 50 100 0")
            #expect(polyline.points == "0 0 50 50 100 0")
        }
    }

    @Suite("Shapes - Polygon")
    struct PolygonTests {
        @Test
        func `Polygon creation`() {
            let polygon = W3C_SVG2.Shapes.Polygon(coordinates: [(50, 0), (100, 100), (0, 100)])
            #expect(polygon.vertices.count == 3)
        }

        @Test
        func `Polygon triangle`() {
            let triangle = W3C_SVG2.Shapes.Polygon(coordinates: [(50, 0), (100, 100), (0, 100)])
            #expect(triangle.vertices.count == 3)
            #expect(triangle.vertices[0].x == 50)
            #expect(triangle.vertices[0].y == 0)
        }
    }

    @Suite("Document - SVG")
    struct SVGTests {
        @Test
        func `SVG creation`() {
            let svg = W3C_SVG2.Document.SVG(
                width: .number(100),
                height: .number(100),
                viewBox: W3C_SVG2.Types.ViewBox(width: 100, height: 100)
            )
            #expect(svg.width == .number(100))
            #expect(svg.height == .number(100))
            #expect(svg.viewBox?.description == "0 0 100 100")
        }

        @Test
        func `SVG tag name`() {
            #expect(W3C_SVG2.Document.SVG.tagName == "svg")
        }

        @Test
        func `SVG with position`() {
            let svg = W3C_SVG2.Document.SVG(
                x: .number(10),
                y: .number(20),
                width: .number(100),
                height: .number(100)
            )
            #expect(svg.x == .number(10))
            #expect(svg.y == .number(20))
        }
    }

    @Suite("Document - Group")
    struct GroupTests {
        @Test
        func `Group creation`() {
            let group = W3C_SVG2.Document.Group(id: "myGroup")
            #expect(group.id == "myGroup")
        }

        @Test
        func `Group tag name`() {
            #expect(W3C_SVG2.Document.Group.tagName == "g")
        }

        @Test
        func `Group without id`() {
            let group = W3C_SVG2.Document.Group()
            #expect(group.id == nil)
        }
    }

    @Suite("Document - Defs")
    struct DefsTests {
        @Test
        func `Defs creation`() {
            let defs = W3C_SVG2.Document.Defs()
            #expect(defs.id == nil)
        }

        @Test
        func `Defs tag name`() {
            #expect(W3C_SVG2.Document.Defs.tagName == "defs")
        }

        @Test
        func `Defs with id`() {
            let defs = W3C_SVG2.Document.Defs(id: "myDefs")
            #expect(defs.id == "myDefs")
        }
    }

    @Suite("Document - Symbol")
    struct SymbolTests {
        @Test
        func `Symbol creation`() {
            let symbol = W3C_SVG2.Document.Symbol(
                id: "icon",
                viewBox: W3C_SVG2.Types.ViewBox(width: 24, height: 24)
            )
            #expect(symbol.id == "icon")
            #expect(symbol.viewBox?.description == "0 0 24 24")
        }

        @Test
        func `Symbol tag name`() {
            #expect(W3C_SVG2.Document.Symbol.tagName == "symbol")
        }

        @Test
        func `Symbol with geometry`() {
            let symbol = W3C_SVG2.Document.Symbol(
                id: "icon",
                x: 10,
                y: 20,
                width: 100,
                height: 100
            )
            #expect(symbol.x == 10)
            #expect(symbol.y == 20)
            #expect(symbol.width == 100)
            #expect(symbol.height == 100)
        }
    }

    @Suite("Document - Use")
    struct UseTests {
        @Test
        func `Use creation`() {
            let use = W3C_SVG2.Document.Use(href: "#icon", x: 50, y: 50)
            #expect(use.href == "#icon")
            #expect(use.x == 50)
            #expect(use.y == 50)
        }

        @Test
        func `Use tag name`() {
            #expect(W3C_SVG2.Document.Use.tagName == "use")
        }

        @Test
        func `Use with dimensions`() {
            let use = W3C_SVG2.Document.Use(
                href: "#icon",
                x: 10,
                y: 20,
                width: 100,
                height: 100
            )
            #expect(use.width == 100)
            #expect(use.height == 100)
        }
    }

    @Suite("PaintServers - LinearGradient")
    struct LinearGradientTests {
        @Test
        func `LinearGradient creation`() {
            let gradient = W3C_SVG2.PaintServers.LinearGradient(
                id: "myGradient",
                x1: "0%",
                y1: "0%",
                x2: "100%",
                y2: "100%"
            )
            #expect(gradient.id == "myGradient")
            #expect(gradient.x1 == "0%")
            #expect(gradient.y1 == "0%")
            #expect(gradient.x2 == "100%")
            #expect(gradient.y2 == "100%")
        }

        @Test
        func `LinearGradient tag name`() {
            #expect(W3C_SVG2.PaintServers.LinearGradient.tagName == "linearGradient")
        }

        @Test
        func `LinearGradient with href`() {
            let gradient = W3C_SVG2.PaintServers.LinearGradient(
                id: "gradient2",
                href: "#gradient1"
            )
            #expect(gradient.href == "#gradient1")
        }
    }

    @Suite("PaintServers - RadialGradient")
    struct RadialGradientTests {
        @Test
        func `RadialGradient creation`() {
            let gradient = W3C_SVG2.PaintServers.RadialGradient(
                id: "radialGrad",
                cx: "50%",
                cy: "50%",
                r: "50%"
            )
            #expect(gradient.id == "radialGrad")
            #expect(gradient.cx == "50%")
            #expect(gradient.cy == "50%")
            #expect(gradient.r == "50%")
        }

        @Test
        func `RadialGradient tag name`() {
            #expect(W3C_SVG2.PaintServers.RadialGradient.tagName == "radialGradient")
        }

        @Test
        func `RadialGradient with focal point`() {
            let gradient = W3C_SVG2.PaintServers.RadialGradient(
                id: "radial",
                cx: "50%",
                cy: "50%",
                r: "50%",
                fx: "30%",
                fy: "30%",
                fr: "10%"
            )
            #expect(gradient.fx == "30%")
            #expect(gradient.fy == "30%")
            #expect(gradient.fr == "10%")
        }
    }

    @Suite("PaintServers - Stop")
    struct StopTests {
        @Test
        func `Stop creation`() {
            let stop = W3C_SVG2.PaintServers.Stop(offset: "50%")
            #expect(stop.offset == "50%")
        }

        @Test
        func `Stop tag name`() {
            #expect(W3C_SVG2.PaintServers.Stop.tagName == "stop")
        }

        @Test
        func `Stop with numeric offset`() {
            let stop = W3C_SVG2.PaintServers.Stop(offset: "0.5")
            #expect(stop.offset == "0.5")
        }
    }

    @Suite("PaintServers - Pattern")
    struct PatternTests {
        @Test
        func `Pattern creation`() {
            let pattern = W3C_SVG2.PaintServers.Pattern(
                id: "dots",
                x: 0,
                y: 0,
                width: 10,
                height: 10
            )
            #expect(pattern.id == "dots")
            #expect(pattern.x == 0)
            #expect(pattern.y == 0)
            #expect(pattern.width == 10)
            #expect(pattern.height == 10)
        }

        @Test
        func `Pattern tag name`() {
            #expect(W3C_SVG2.PaintServers.Pattern.tagName == "pattern")
        }

        @Test
        func `Pattern with viewBox`() {
            let pattern = W3C_SVG2.PaintServers.Pattern(
                id: "pattern",
                width: 20,
                height: 20,
                viewBox: W3C_SVG2.Types.ViewBox(width: 10, height: 10)
            )
            #expect(pattern.viewBox?.description == "0 0 10 10")
        }
    }

    @Suite("Painting - LineCap")
    struct LineCapTests {
        @Test
        func `LineCap butt`() {
            let lineCap = W3C_SVG2.Painting.LineCap.butt
            #expect(lineCap.rawValue == "butt")
        }

        @Test
        func `LineCap round`() {
            let lineCap = W3C_SVG2.Painting.LineCap.round
            #expect(lineCap.rawValue == "round")
        }

        @Test
        func `LineCap square`() {
            let lineCap = W3C_SVG2.Painting.LineCap.square
            #expect(lineCap.rawValue == "square")
        }
    }

    @Suite("Painting - LineJoin")
    struct LineJoinTests {
        @Test
        func `LineJoin miter`() {
            let lineJoin = W3C_SVG2.Painting.LineJoin.miter
            #expect(lineJoin.rawValue == "miter")
        }

        @Test
        func `LineJoin round`() {
            let lineJoin = W3C_SVG2.Painting.LineJoin.round
            #expect(lineJoin.rawValue == "round")
        }

        @Test
        func `LineJoin bevel`() {
            let lineJoin = W3C_SVG2.Painting.LineJoin.bevel
            #expect(lineJoin.rawValue == "bevel")
        }
    }

    @Suite("Painting - FillRule")
    struct FillRuleTests {
        @Test
        func `FillRule nonzero`() {
            let fillRule = W3C_SVG2.Painting.FillRule.nonzero
            #expect(fillRule.rawValue == "nonzero")
        }

        @Test
        func `FillRule evenodd`() {
            let fillRule = W3C_SVG2.Painting.FillRule.evenodd
            #expect(fillRule.rawValue == "evenodd")
        }
    }

    @Suite("Painting - ClipPath")
    struct ClipPathTests {
        @Test
        func `ClipPath creation`() {
            let clipPath = W3C_SVG2.Painting.ClipPath(id: "myClip")
            #expect(clipPath.id == "myClip")
        }

        @Test
        func `ClipPath tag name`() {
            #expect(W3C_SVG2.Painting.ClipPath.tagName == "clipPath")
        }

        @Test
        func `ClipPath units`() {
            let userSpace = W3C_SVG2.Painting.ClipPath.Units.userSpaceOnUse
            let objectBBox = W3C_SVG2.Painting.ClipPath.Units.objectBoundingBox
            #expect(userSpace.rawValue == "userSpaceOnUse")
            #expect(objectBBox.rawValue == "objectBoundingBox")
        }
    }

    @Suite("Painting - Mask")
    struct MaskTests {
        @Test
        func `Mask creation`() {
            let mask = W3C_SVG2.Painting.Mask(
                id: "myMask",
                x: 0,
                y: 0,
                width: 100,
                height: 100
            )
            #expect(mask.id == "myMask")
            #expect(mask.x == 0)
            #expect(mask.y == 0)
            #expect(mask.width == 100)
            #expect(mask.height == 100)
        }

        @Test
        func `Mask tag name`() {
            #expect(W3C_SVG2.Painting.Mask.tagName == "mask")
        }

        @Test
        func `Mask units`() {
            let userSpace = W3C_SVG2.Painting.Mask.Units.userSpaceOnUse
            let objectBBox = W3C_SVG2.Painting.Mask.Units.objectBoundingBox
            #expect(userSpace.rawValue == "userSpaceOnUse")
            #expect(objectBBox.rawValue == "objectBoundingBox")
        }
    }

    @Suite("Painting - Marker")
    struct MarkerTests {
        @Test
        func `Marker creation`() {
            let marker = W3C_SVG2.Painting.Marker(
                id: "arrow",
                viewBox: W3C_SVG2.Types.ViewBox(width: 10, height: 10),
                refX: 5,
                refY: 5,
                markerWidth: 6,
                markerHeight: 6,
                orient: "auto"
            )
            #expect(marker.id == "arrow")
            #expect(marker.refX == 5)
            #expect(marker.refY == 5)
            #expect(marker.markerWidth == 6)
            #expect(marker.markerHeight == 6)
            #expect(marker.orient == "auto")
        }

        @Test
        func `Marker tag name`() {
            #expect(W3C_SVG2.Painting.Marker.tagName == "marker")
        }

        @Test
        func `Marker units`() {
            let strokeWidth = W3C_SVG2.Painting.Marker.Units.strokeWidth
            let userSpace = W3C_SVG2.Painting.Marker.Units.userSpaceOnUse
            #expect(strokeWidth.rawValue == "strokeWidth")
            #expect(userSpace.rawValue == "userSpaceOnUse")
        }
    }

    @Suite("Text - Text")
    struct TextTests {
        @Test
        func `Text creation`() {
            let text = W3C_SVG2.Text.Text(
                x: 10,
                y: 20,
                content: "Hello SVG"
            )
            #expect(text.x == 10)
            #expect(text.y == 20)
            #expect(text.content == "Hello SVG")
        }

        @Test
        func `Text tag name`() {
            #expect(W3C_SVG2.Text.Text.tagName == "text")
        }

        @Test
        func `Text with offsets`() {
            let text = W3C_SVG2.Text.Text(
                x: 10,
                y: 20,
                dx: 5,
                dy: 10,
                content: "Offset text"
            )
            #expect(text.dx == 5)
            #expect(text.dy == 10)
        }

        @Test
        func `LengthAdjust enum`() {
            let spacing = W3C_SVG2.Text.Text.LengthAdjust.spacing
            let spacingAndGlyphs = W3C_SVG2.Text.Text.LengthAdjust.spacingAndGlyphs
            #expect(spacing.rawValue == "spacing")
            #expect(spacingAndGlyphs.rawValue == "spacingAndGlyphs")
        }
    }

    @Suite("Text - TSpan")
    struct TSpanTests {
        @Test
        func `TSpan creation`() {
            let tspan = W3C_SVG2.Text.TSpan(
                dx: 5,
                dy: 10,
                content: "styled text"
            )
            #expect(tspan.dx == 5)
            #expect(tspan.dy == 10)
            #expect(tspan.content == "styled text")
        }

        @Test
        func `TSpan tag name`() {
            #expect(W3C_SVG2.Text.TSpan.tagName == "tspan")
        }

        @Test
        func `TSpan with position`() {
            let tspan = W3C_SVG2.Text.TSpan(x: 100, y: 200, content: "positioned")
            #expect(tspan.x == 100)
            #expect(tspan.y == 200)
        }
    }

    @Suite("PaintServers - Gradient Units and Spread Methods")
    struct GradientNestedEnumsTests {
        @Test
        func `LinearGradient GradientUnits`() {
            let userSpace = W3C_SVG2.PaintServers.LinearGradient.GradientUnits.userSpaceOnUse
            let objectBBox = W3C_SVG2.PaintServers.LinearGradient.GradientUnits.objectBoundingBox
            #expect(userSpace.rawValue == "userSpaceOnUse")
            #expect(objectBBox.rawValue == "objectBoundingBox")
        }

        @Test
        func `LinearGradient SpreadMethod`() {
            let pad = W3C_SVG2.PaintServers.LinearGradient.SpreadMethod.pad
            let reflect = W3C_SVG2.PaintServers.LinearGradient.SpreadMethod.reflect
            let repeatSpread = W3C_SVG2.PaintServers.LinearGradient.SpreadMethod.repeat
            #expect(pad.rawValue == "pad")
            #expect(reflect.rawValue == "reflect")
            #expect(repeatSpread.rawValue == "repeat")
        }

        @Test
        func `RadialGradient GradientUnits`() {
            let userSpace = W3C_SVG2.PaintServers.RadialGradient.GradientUnits.userSpaceOnUse
            let objectBBox = W3C_SVG2.PaintServers.RadialGradient.GradientUnits.objectBoundingBox
            #expect(userSpace.rawValue == "userSpaceOnUse")
            #expect(objectBBox.rawValue == "objectBoundingBox")
        }

        @Test
        func `RadialGradient SpreadMethod`() {
            let pad = W3C_SVG2.PaintServers.RadialGradient.SpreadMethod.pad
            let reflect = W3C_SVG2.PaintServers.RadialGradient.SpreadMethod.reflect
            let repeatSpread = W3C_SVG2.PaintServers.RadialGradient.SpreadMethod.repeat
            #expect(pad.rawValue == "pad")
            #expect(reflect.rawValue == "reflect")
            #expect(repeatSpread.rawValue == "repeat")
        }

        @Test
        func `Pattern Units`() {
            let userSpace = W3C_SVG2.PaintServers.Pattern.Units.userSpaceOnUse
            let objectBBox = W3C_SVG2.PaintServers.Pattern.Units.objectBoundingBox
            #expect(userSpace.rawValue == "userSpaceOnUse")
            #expect(objectBBox.rawValue == "objectBoundingBox")
        }
    }
}
