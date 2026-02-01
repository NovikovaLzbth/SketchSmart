//
//  MemoryPaletteGameView.swift
//  SketchSmart
//
//  Created by Елизавета on 24.12.2025.
//

import Foundation
import SwiftUI
import AVFoundation

struct MemoryPaletteGameView: View {
    // dismiss для закрытия экрана
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = GameViewMemoryModel()
    
    @State private var showHintOverlay = false
    @State private var isHintVisible = false
    
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore = false
    
    private let columns = [GridItem(.adaptive(minimum: 60))]
    
    var body: some View {
        ZStack {
            VStack {
                if showHintOverlay {
                    HintOverlayView(isVisible: $isHintVisible, showOverlay: $showHintOverlay)
                }
            }
            .zIndex(1)
            .onAppear {
                // Автоматический показ только при первом запуске
                if !hasLaunchedBefore {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        showHintAutomatically()
                        hasLaunchedBefore = true
                    }
                }
            }
            
            VStack {
                HStack() {
                    Button {
                        showHintAgain()
                    } label: {
                        Image("Image 33")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .padding(.bottom)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                
                // Статистика
                HStack {
                    VStack {
                        Text("ХОДЫ")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("\(viewModel.moves)")
                            .font(.title2.bold())
                            .foregroundColor(.darkBlue)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("ПАРЫ")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("\(viewModel.matchedPairs)/\(viewModel.colorPairsCount)")
                            .font(.title2.bold())
                            .foregroundColor(.darkBlue)
                    }
                }
                .padding(.horizontal)
                
                // Игровое поле
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.cards) { card in
                            CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    if !viewModel.isProcessing && !card.isMatched && !card.isFaceUp {
                                        viewModel.selectCard(card)
                                    }
                                }
                        }
                    }
                    .padding()
                }
                
                // Кнопка перезапуска
                Button(action: viewModel.startNewGame) {
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
            .alert("Поздравляем!", isPresented: $viewModel.showingWinAlert) {
                Button("Выйти", role: .cancel) {
                    DispatchQueue.main.async {
                        dismiss()
                    }
                }
                Button("Новая игра", action: viewModel.startNewGame)
            } message: {
                Text("Вы нашли все \(viewModel.colorPairsCount) пар за \(viewModel.moves) ходов!")
            }
            .onAppear {
                viewModel.startNewGame()
            }
        }
    }
    
    private func showHintAutomatically() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            showHintOverlay = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                isHintVisible = true
            }
        }
    }
    
    private func showHintAgain() {
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



