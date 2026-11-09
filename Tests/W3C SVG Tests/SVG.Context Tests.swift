import Angle
import Testing
import W3C_SVG

enum `SVG.Context Tests` {}

extension `SVG.Context Tests` {
    @Suite
    struct `Shape contexts` {
        @Test
        func `a circle becomes a circle element`() {
            let circle = W3C_SVG2.Shapes.Circle(cx: 10, cy: 20, r: 5)
            #expect(circle.svg.element == circle)
        }

        @Test
        func `a rectangle becomes a rect element`() {
            let rectangle = W3C_SVG2.Shapes.Rectangle(x: 1, y: 2, width: 30, height: 40)
            let element = rectangle.svg.element
            #expect(element?.x == 1)
            #expect(element?.y == 2)
            #expect(element?.width == 30)
            #expect(element?.height == 40)
        }

        @Test
        func `an unrotated ellipse maps the semi-major axis to rx`() {
            let ellipse = W3C_SVG2.Shapes.Ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
            let element = ellipse.svg.element
            #expect(element?.cx == 100)
            #expect(element?.cy == 50)
            #expect(element?.rx == 80)
            #expect(element?.ry == 40)
        }

        @Test
        func `a rotated ellipse has no ellipse element`() {
            var ellipse = W3C_SVG2.Shapes.Ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
            ellipse.rotation = Radian<Double>(_unchecked: 0.5)
            #expect(ellipse.svg.element == nil)
        }

        @Test
        func `a polygon becomes a polygon element`() {
            let polygon = W3C_SVG2.Polygon(vertices: [
                W3C_SVG2.Point(x: 0, y: 0),
                W3C_SVG2.Point(x: 10, y: 0),
                W3C_SVG2.Point(x: 0, y: 10),
            ])
            let element = polygon.svg.element
            #expect(element.points == W3C_SVG2.Shapes.Polygon(coordinates: [(0, 0), (10, 0), (0, 10)]).points)
        }
    }
}
