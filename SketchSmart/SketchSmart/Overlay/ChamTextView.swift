import Foundation
import SwiftUI

struct ChamTextView: View {
    @Binding var showOverlay: Bool
    @State private var showContent = false
    
    let imageName: String
    
    var body: some View {
        ZStack {
            // Затемненный фон
            Color.darkBlue
                .opacity(0.8)
                .ignoresSafeArea()
            
            // Контент появляется с анимацией
            if showContent {
                VStack(spacing: 0) {
                    Image("Image 43")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .padding()
                    
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding()
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .onTapGesture {
            dismissHint()
        }
        .onAppear {
            // Анимация появления контента
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                showContent = true
            }
        }
    }
    
    private func dismissHint() {
        // Анимация исчезновения
        withAnimation(.easeOut(duration: 0.3)) {
            showContent = false
        }
        
        // Закрываем оверлей после анимации
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            showOverlay = false
        }
    }
}

