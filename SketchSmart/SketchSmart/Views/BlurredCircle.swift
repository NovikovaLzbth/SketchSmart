import SwiftUI

struct BlurredCircle: View {
    let color: Color
    let size: CGFloat
    let initialPosition: CGPoint
    let animationDuration: Double
    
    @State private var animate = false
    @State private var randomOffset: CGSize = .zero
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
            .blur(radius: size * 0.10)
            .position(
                x: initialPosition.x + (animate ? randomOffset.width : 0),
                y: initialPosition.y + (animate ? randomOffset.height : 0)
            )
            .onAppear {
                randomOffset = CGSize(
                    width: CGFloat.random(in: -200...200),
                    height: CGFloat.random(in: -200...200)
                )
                
                withAnimation(
                    Animation
                        .easeInOut(duration: animationDuration)
                        .repeatForever(autoreverses: true)
                        .delay(Double.random(in: 0...2))
                ) {
                    animate.toggle()
                }
            }
    }
}
