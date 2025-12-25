//
//  Launch.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI

struct Launch: View {
    @State private var isActive = false
    @State private var currentImage = 0
    @State private var loadingProgress: CGFloat = 0
    
    private let images = ["LaunchScreen1", "LaunchScreen2", "LaunchScreen3"]
    
    var body: some View {
        Group {
            if isActive {
                ContentView()
                    .transition(.slide)
            } else {
                ZStack {
                    Color(.background)
                        .ignoresSafeArea()
                    
                    // Предзагружаем все изображения
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .opacity(index == currentImage ? 1 : 0) // Показываем только текущее
                    }
                    
                    VStack {
                        Spacer()
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 200, height: 6)
                                .foregroundColor(Color.gray.opacity(0.3))
                            
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: loadingProgress * 200, height: 6)
                                .foregroundColor(.lightBlue)
                                .animation(.linear(duration: 0.2), value: loadingProgress)
                        }
                        .padding(.bottom, 50)
                    }
                }
                .onAppear {
                    startSequence()
                    
                    for i in 1...10 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                            loadingProgress = CGFloat(i) / 10
                        }
                    }
                }
            }
        }
    }
    
    private func startSequence() {
        // Меняем изображения без анимации
        let changeTimes = [0.7, 1.4] // моменты смены
        
        for (index, time) in changeTimes.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                currentImage = index + 1
            }
        }
    
        // Переход
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 0.5)) {
                isActive = true
            }
        }
    }
}

#Preview {
    Launch()
}
