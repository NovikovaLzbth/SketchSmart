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
                // Отображение счета
                Text("Счет: \(viewModel.score)")
                    .font(.title)
                    .foregroundColor(.white)
                
                // Отображение уровня
                Text("Уровень: \(viewModel.level)")
                    .font(.headline)
                    .foregroundColor(.white)
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
                                viewModel.checkAnswer(index) // Обработка нажатия
                                
                                AudioServicesPlaySystemSound(1113)
                                AudioServicesPlaySystemSound(1519)
                            }
                    }
                }
                .padding()
                .background(Color.white).cornerRadius(10)
            }
            .onAppear {
                viewModel.startNewRound() // Первый раунд при появлении экрана
            }
        }
    }
}
    
