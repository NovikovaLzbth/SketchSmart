//
//  GameViewModel.swift
//  SketchSmart
//
//  Created by Елизавета on 30.01.2026.
//

import Foundation
import SwiftUI
import AVFoundation

class GameViewMemoryModel: ObservableObject {
    // Конфигурация игры
    let colorPairsCount = 10 // Количество пар цветов
    
    @Published var cards: [Card] = []
    @Published var selectedCards: [Card] = []
    @Published var matchedPairs = 0
    @Published var moves = 0
    @Published var showingWinAlert = false
    @Published var isProcessing = false
    
    func startNewGame() {
        // Сбрасываем состояние
        matchedPairs = 0
        moves = 0
        selectedCards.removeAll()
        
        // Генерируем случайные цвета
        let colors = generateRandomColors()
        
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
    
    func selectCard(_ card: Card) {
        guard !isProcessing && !card.isMatched && !card.isFaceUp else { return }
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
                self.checkForMatch()
                self.isProcessing = false
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
                    self.showingWinAlert = true
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
