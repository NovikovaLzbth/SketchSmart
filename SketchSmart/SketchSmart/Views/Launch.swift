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
    
    private let images = ["LaunchScreen1", "LaunchScreen2", "LaunchScreen3", "LaunchScreen2", "LaunchScreen1"]
    
    // Цвета из HEX кодов
    private let color1 = Color(red: 45/255, green: 55/255, blue: 72/255)   // 2D3748
    private let color2 = Color(red: 56/255, green: 178/255, blue: 172/255) // 38B2AC
    private let color3 = Color(red: 113/255, green: 128/255, blue: 150/255) // 718096
    
    var body: some View {
        Group {
            if isActive {
                AuthView()
                    .transition(.identity)
            } else {
                ZStack {
                    Color(.background)
                        .ignoresSafeArea()
                    
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .opacity(index == currentImage ? 1 : 0)
                    }
                    
                    VStack {
                        Spacer()
                        
                        // Линия загрузки
                        ZStack(alignment: .leading) {
                            // Фоновая линия
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 200, height: 20)
                                .foregroundColor(color1.opacity(0.2))
                            
                            // Прогресс с градиентом
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [color1, color2, color3]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: loadingProgress * 180, height: 16)
                                .padding(.leading, 10)
                                .animation(.easeInOut(duration: 0.2), value: loadingProgress)
                            
                            Circle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [color2, color1]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 15
                                    )
                                )
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.8), lineWidth: 2)
                                )
                                .overlay(
                                    Circle()
                                        .fill(color2)
                                        .frame(width: 10, height: 10)
                                        .offset(x: 4, y: -4)
                                )
                                .offset(x: loadingProgress * 180 - 15)
                                .animation(.easeInOut(duration: 0.2), value: loadingProgress)
                                .shadow(color: color2.opacity(0.5), radius: 3)
                        }
                        .padding(.bottom, 50)
                    }
                }
                .onAppear {
                    startSequence()
                    
                    // Прогресс бар
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
        let changeTimes = [0.3, 0.6, 0.9, 1.2]
        
        for (index, time) in changeTimes.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                currentImage = index + 1
            }
        }
    
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
