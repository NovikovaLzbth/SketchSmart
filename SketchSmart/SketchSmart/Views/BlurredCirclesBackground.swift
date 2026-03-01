import SwiftUI

struct BlurredCirclesBackground: View {
    @State private var animate = false
    
    let circleCount = 3
    let animationDuration: Double = 5
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.background.ignoresSafeArea()
                
                ForEach(0..<circleCount, id: \.self) { index in
                    BlurredCircle(
                        color: circleColor(for: index),
                        size: circleSize(for: index, in: geometry),
                        initialPosition: initialPosition(for: index, in: geometry),
                        animationDuration: animationDuration
                    )
                }
            }
        }
        .ignoresSafeArea()
    }
    
    // Цвета для кругов
    func circleColor(for index: Int) -> Color {
        let colors: [Color] = [
            .indigo.opacity(0.2),
            .turquoise.opacity(0.2),
            .yellow.opacity(0.2)
        ]
        return colors[index % colors.count]
    }
    
    // Размеры кругов
    func circleSize(for index: Int, in geometry: GeometryProxy) -> CGFloat {
        let minSize = min(geometry.size.width, geometry.size.height)
        let sizes: [CGFloat] = [
            minSize * 0.7,
            minSize * 0.8,
            minSize * 0.6
        ]
        return sizes[index % sizes.count]
    }
    
    // Начальные позиции
    func initialPosition(for index: Int, in geometry: GeometryProxy) -> CGPoint {
        let width = geometry.size.width
        let height = geometry.size.height
        
        let positions: [CGPoint] = [
            CGPoint(x: width * 0.8, y: height * 0.3),
            CGPoint(x: width * 0.7, y: height * 0.6),
            CGPoint(x: width * 0.2, y: height * 0.8)
        ]
        
        return positions[index % positions.count]
    }
}
