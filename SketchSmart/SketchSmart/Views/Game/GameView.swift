//
//  ColorGameView.swift
//  SketchSmart
//
//  Created by Елизавета on 29.05.2025.
//

import SwiftUI
import AVFoundation

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showHintOverlay = false
    @State private var isHintVisible = false
    
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore = false
    
    var body: some View {
        ZStack {
            
            VStack {
                if showHintOverlay {
                    OverlayView(isVisible: $isHintVisible, showOverlay: $showHintOverlay, viewModel: viewModel)
                }
            }
            .zIndex(1)
            .onAppear {
                // Автоматический показ только при первом запуске
                if !hasLaunchedBefore {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        hintAutomatically()
                        hasLaunchedBefore = true
                    }
                }
            }
            
            Color.background.ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Время: \(viewModel.timeRemaining) сек")
                            .font(.title)
                            .bold()
                            .foregroundColor(.darkBlue)
                            .padding(.bottom)
                        
                        Button {
                            hintAgain()
                        } label: {
                            Text("pause")
                        }

                    }
                    
                    HStack {
                        Text("Счет: \(viewModel.score)")
                            .font(.title2)
                            .foregroundColor(.lightBlue)
                        
                        Spacer()
                        
                        Text("Уровень: \(viewModel.level)")
                            .font(.title2)
                            .foregroundColor(.lightBlue)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Игровое поле
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 10),
                                  count: viewModel.gridSize),
                    spacing: 10
                ) {
                    ForEach(0..<viewModel.colors.count, id: \.self) { index in
                        TileView(
                            color: viewModel.colors[index],
                            isWrong: viewModel.wrongTileIndex == index,
                            action: {
                                if viewModel.timeRemaining > 0 {
                                    viewModel.checkAnswer(index)
                                    AudioServicesPlaySystemSound(1519)
                                }
                            }
                        )
                    }
                }
                .padding()
                
                Spacer()
                
                Button(action: viewModel.restartGame) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Новая игра")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.darkBlue)
                    .cornerRadius(15)
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.startNewRound()
            viewModel.startTimer()
        }
        .onDisappear {
            viewModel.timer?.invalidate()
        }
        .alert("Игра окончена!", isPresented: $viewModel.isGameOver) {
            Button("Начать заново") {
                viewModel.restartGame()
            }
            Button("Выйти", role: .cancel) {
                dismiss()
            }
        } message: {
            Text("Ваш счет: \(viewModel.score)\nУровень: \(viewModel.level)")
        }
    }
    private func hintAutomatically() {
        viewModel.pauseTimer()
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            showHintOverlay = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                isHintVisible = true
            }
        }
    }
    
    private func hintAgain() {
        viewModel.pauseTimer()
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            showHintOverlay = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                isHintVisible = true
            }
        }
    }
}

struct TileView: View {
    let color: Color
    let isWrong: Bool
    let action: () -> Void
    
    @State private var shakeOffset: CGFloat = 0
    
    var body: some View {
        Button(action: action) {
            color
                .cornerRadius(8)
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isWrong ? Color.red : Color.clear, lineWidth: 3)
                )
        }
        .buttonStyle(PlainButtonStyle())
        .offset(x: shakeOffset)
        .onChange(of: isWrong) { wrong in
            if wrong {
                startShakeAnimation()
            }
        }
    }
    
    private func startShakeAnimation() {
        // Сбрасываем позицию
        shakeOffset = 0
        
        // Анимация дрожания
        let animation = Animation
            .easeInOut(duration: 0.05)
            .repeatCount(5, autoreverses: true)
        
        withAnimation(animation) {
            shakeOffset = 8
        }
        
        // Возвращаем на место
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.spring()) {
                shakeOffset = 0
            }
        }
    }
}

struct GameButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
