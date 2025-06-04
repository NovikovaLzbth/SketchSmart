//
//  GameViewModel.swift
//  SketchSmart
//
//  Created by Елизавета on 29.05.2025.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    // Состояние игры:
    @Published var colors: [Color] = [] // Массив цветов для плиток
    @Published var targetIndex = 0 // Индекс плитки, которая отличается
    @Published var score = 0 // Текущий счет игрока
    @Published var level = 1 // Текущий уровень сложности
    @Published var gridSize = 2 // Размер сетки (2x2, 3x3 и т.д.)
    @Published var timeRemaining = 60 // Начальное время - 60 секунд
    @Published var timer: Timer?
    @Published var isGameOver = false
    
    // Начать новый раунд игры
    func startNewRound() {
        // Увеличиваем сложность каждые 5 очков
        if score > 0 && score % 5 == 0 {
            level += 1
            gridSize = min(5, gridSize + 1) // Максимум 5x5
        }
        
        // Базовый случайный цвет
        let baseColor = Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
        
        // Получаем компоненты цвета
        let components = baseColor.components
        
        // Целевой цвет (немного отличается)
        let difference = max(0.1, 0.5 - Double(level) * 0.02)
        let targetRed = min(1, max(0, components.red + .random(in: -difference...difference)))
        let targetGreen = min(1, max(0, components.green + .random(in: -difference...difference)))
        let targetBlue = min(1, max(0, components.blue + .random(in: -difference...difference)))
        
        let targetColor = Color(red: targetRed, green: targetGreen, blue: targetBlue)
        
        // Заполняем массив цветов
        colors = Array(repeating: baseColor, count: gridSize * gridSize)
        targetIndex = Int.random(in: 0..<colors.count)
        colors[targetIndex] = targetColor
    }
    
    // Проверить ответ игрока
    func checkAnswer(_ index: Int) {
        if index == targetIndex {
            score += 1 // Правильный ответ - увеличение счета
        } else {
            score = max(0, score - 1)
        }
        startNewRound() // Новый раунд
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                self.isGameOver = true
            }
        }
    }
    
    func restartGame() {
        timeRemaining = 60
        score = 0 // Сбрасываем счет
        level = 1 // Сбрасываем уровень
        gridSize = 2 // Сбрасываем размер сетки
        isGameOver = false
        startNewRound()
        startTimer()
    }
}

extension Color {
    var components: (red: Double, green: Double, blue: Double) {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (Double(red), Double(green), Double(blue))
    }
}


