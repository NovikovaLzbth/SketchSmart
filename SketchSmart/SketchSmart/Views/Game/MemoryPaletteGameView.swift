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
    // Конфигурация игры
    private let columns = [GridItem(.adaptive(minimum: 70))]
    private let colorPairsCount = 6 // Количество пар цветов
    
    @State private var cards: [Card] = []
    @State private var selectedCards: [Card] = []
    @State private var matchedPairs = 0
    @State private var moves = 0
    @State private var showingWinAlert = false
    @State private var isProcessing = false
    
    var body: some View {
        VStack {
            // Статистика
            HStack {
                VStack {
                    Text("ХОДЫ")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("\(moves)")
                        .font(.title2.bold())
                        .foregroundColor(.darkBlue)
                }
                
                Spacer()
                
                VStack {
                    Text("ПАРЫ")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("\(matchedPairs)/\(colorPairsCount)")
                        .font(.title2.bold())
                        .foregroundColor(.darkBlue)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            // Игровое поле
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                if !isProcessing && !card.isMatched && !card.isFaceUp {
                                    selectCard(card)
                                }
                            }
                    }
                }
                .padding()
            }
            
            // Кнопка перезапуска
            Button(action: startNewGame) {
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
        .alert("Поздравляем!", isPresented: $showingWinAlert) {
            Button("Новая игра", action: startNewGame)
        } message: {
            Text("Вы нашли все \(colorPairsCount) пар за \(moves) ходов!")
        }
        .onAppear {
            startNewGame()
        }
    }
    
    private func selectCard(_ card: Card) {
        guard selectedCards.count < 2 else { return }
        
        // Переворачиваем карточку
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            cards[index].isFaceUp = true
            selectedCards.append(cards[index])
        }
        
        // Если выбрано две карточки
        if selectedCards.count == 2 {
            moves += 1
            isProcessing = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                checkForMatch()
                isProcessing = false
            }
        }
    }
    
    private func checkForMatch() {
        let firstCard = selectedCards[0]
        let secondCard = selectedCards[1]
        
        // Проверяем совпадение
        if firstCard.color == secondCard.color {
            // Найдена пара
            if let firstIndex = cards.firstIndex(where: { $0.id == firstCard.id }) {
                cards[firstIndex].isMatched = true
            }
            if let secondIndex = cards.firstIndex(where: { $0.id == secondCard.id }) {
                cards[secondIndex].isMatched = true
            }
            matchedPairs += 1
            
            AudioServicesPlaySystemSound(1519)
            
            // Проверяем завершение игры
            if matchedPairs == colorPairsCount {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showingWinAlert = true
                }
            }
        } else {
            // Не совпали - переворачиваем обратно
            if let firstIndex = cards.firstIndex(where: { $0.id == firstCard.id }) {
                cards[firstIndex].isFaceUp = false
            }
            if let secondIndex = cards.firstIndex(where: { $0.id == secondCard.id }) {
                cards[secondIndex].isFaceUp = false
            }
        }
        
        selectedCards.removeAll()
    }
    
    private func startNewGame() {
        // Сбрасываем состояние
        matchedPairs = 0
        moves = 0
        selectedCards.removeAll()
        
        // Генерируем случайные цвета
        var colors = generateRandomColors()
        
        // Создаем пары карточек
        var newCards: [Card] = []
        for color in colors {
            let card1 = Card(color: color)
            let card2 = Card(color: color)
            newCards.append(contentsOf: [card1, card2])
        }
        
        // Перемешиваем карточки
        cards = newCards.shuffled()
    }
    
    private func generateRandomColors() -> [Color] {
        var colors: [Color] = []
        
        while colors.count < colorPairsCount {
            // Генерируем случайный цвет
            let randomColor = Color(
                red: Double.random(in: 0.1...0.9),
                green: Double.random(in: 0.1...0.9),
                blue: Double.random(in: 0.1...0.9)
            )
            
            // Проверяем, чтобы цвета не были слишком похожими
            if !colors.contains(where: { isSimilarColor($0, randomColor) }) {
                colors.append(randomColor)
            }
        }
        
        return colors
    }
    
    private func isSimilarColor(_ color1: Color, _ color2: Color) -> Bool {
        // Конвертируем Color в UIColor для сравнения
        let uiColor1 = UIColor(color1)
        let uiColor2 = UIColor(color2)
        
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        uiColor1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        uiColor2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        // Вычисляем разницу между цветами
        let difference = sqrt(pow(r1 - r2, 2) + pow(g1 - g2, 2) + pow(b1 - b2, 2))
        
        // Если цвета слишком похожи (разница менее 0.3), возвращаем true
        return difference < 0.3
    }
}
