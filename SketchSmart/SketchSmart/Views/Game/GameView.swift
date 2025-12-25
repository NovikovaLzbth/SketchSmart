//
//  ColorGameView.swift
//  SketchSmart
//
//  Created by Елизавета on 29.05.2025.
//

import SwiftUI
import AVFoundation

struct GameView: View {
    @StateObject private var viewModel: GameViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: GameViewModel())
    }
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            VStack {
                Text("Время: \(viewModel.timeRemaining) сек")
                    .font(.title)
                    .bold(true)
                    .foregroundColor(.darkBlue)
                    .padding(.top, -90)
                    .padding(.leading, -170)
                
                // Отображение счета
                Text("Счет: \(viewModel.score)")
                    .font(.title)
                    .foregroundColor(.lightBlue)
                
                // Отображение уровня
                Text("Уровень: \(viewModel.level)")
                    .font(.headline)
                    .foregroundColor(.lightBlue)
                    .padding(.bottom, 10)
                
                // Игровое поле с плитками
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: viewModel.gridSize), spacing: 10) {
                    // Плитки в сетке
                    ForEach(0..<viewModel.colors.count, id: \.self) { index in
                        Rectangle()
                            .fill(viewModel.colors[index]) // Заливка цветом из массива
                            .aspectRatio(1, contentMode: .fit) // Квадратные плитки
                            .cornerRadius(8)
                            .onTapGesture {
                                if viewModel.timeRemaining > 0 { // Проверяем, что время не вышло
                                    viewModel.checkAnswer(index)
                                    AudioServicesPlaySystemSound(1519)
                                }
                            }
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.startNewRound() // Первый раунд при появлении экрана
                viewModel.startTimer()
            }
            .alert("Игра окончена!", isPresented: $viewModel.isGameOver) {
                Button {
                    viewModel.restartGame()
                } label: {
                    Text("Начать заново")
                }
                
            } message: {
                Text("Ваш счет: \(viewModel.score)\nУровень: \(viewModel.level)")
            }
        }
    }
}

