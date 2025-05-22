//
//  Launch.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI

struct Launch: View {
    @State private var isActive = false
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0
    @State private var loadingProgress: CGFloat = 0
    
    var body: some View {
        Group {
            if isActive {
                ContentView()
                    .transition(.opacity)
            } else {
                ZStack {
                    // Фоновый цвет
                    Color(.babyYellow)
                        .ignoresSafeArea()
                    
                    // Логотип
                    Image("LaunchScreen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 440)
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)
                    
                    // Полоска загрузки
                    VStack {
                        Spacer()
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 200, height: 6)
                                .foregroundColor(Color.gray.opacity(0.3))
                            
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: loadingProgress * 200, height: 6)
                                .foregroundColor(.background)
                                .animation(.linear(duration: 0.2), value: loadingProgress)
                        }
                        .padding(.bottom, 50)
                    }
                }
                .onAppear {
                    // Анимация появления логотипа
                    withAnimation(.easeOut(duration: 0.5)) {
                        logoScale = 1.0
                        logoOpacity = 1.0
                    }
                    
                    // Анимация прогресса загрузки
                    for i in 1...10 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                            loadingProgress = CGFloat(i) / 10
                        }
                    }
                    
                    // Задержка перед переходом
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Launch()
}
