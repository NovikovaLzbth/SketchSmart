import SwiftUI

struct HintOverlayView: View {
    @Binding var showOverlay: Bool
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            Color.darkBlue
                .opacity(0.7)
                .ignoresSafeArea()
                .onTapGesture {
                    dismissHint()
                }
            
            if showOverlay {
                VStack {
                    Image("Image 32")
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                self.showOverlay = false
            }
        }
    }
}
