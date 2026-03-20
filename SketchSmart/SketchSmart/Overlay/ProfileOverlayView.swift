import Foundation
import SwiftUI

struct ProfileOverlayView: View {
    @Binding var showOverlay: Bool
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            // Затемненный фон
            Color.darkBlue
                .opacity(0.7)
                .ignoresSafeArea()
            
            // Контент появляется с анимацией
            if showContent {
                VStack {
                    Image("Image 42")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .padding()
                    
                    Button("Понятно!") {
                        dismissHint()
                    }
                    .padding()
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.darkBlue)
                    .background(Color.background)
                    .cornerRadius(20)
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

