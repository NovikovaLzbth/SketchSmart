import SwiftUI
import Combine

final class GameViewModel: ObservableObject {
    @Published var colors: [Color] = []
    @Published var targetIndex = 0
    @Published var score = 0
    @Published var level = 1
    @Published var gridSize = 2
    @Published var timeRemaining = 60
    @Published var timer: Timer?
    @Published var isGameOver = false
    
    @Published var wrongTileIndex: Int? = nil
    
    func startNewRound() {
        wrongTileIndex = nil
        
        if score > 0 && score % 5 == 0 {
            level += 1
            gridSize = min(5, gridSize + 1)
        }
        
        let baseColor = Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
        
        let components = baseColor.components
        let difference = max(0.1, 0.5 - Double(level) * 0.02)
        
        let targetColor = Color(
            red: min(1, max(0, components.red + .random(in: -difference...difference))),
            green: min(1, max(0, components.green + .random(in: -difference...difference))),
            blue: min(1, max(0, components.blue + .random(in: -difference...difference)))
        )
        
        colors = Array(repeating: baseColor, count: gridSize * gridSize)
        targetIndex = Int.random(in: 0..<colors.count)
        colors[targetIndex] = targetColor
    }
    
    func checkAnswer(_ index: Int) {
        if index == targetIndex {
            score += 1
            startNewRound()
        } else {
            score = max(0, score - 1)
            wrongTileIndex = index
            
            // Сбрасываем через 0.4 секунды (быстрее)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.wrongTileIndex = nil
            }
        }
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
        score = 0
        level = 1
        gridSize = 2
        isGameOver = false
        wrongTileIndex = nil
        startNewRound()
        startTimer()
    }
}

extension Color {
    var components: (red: Double, green: Double, blue: Double, opacity: Double) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0
        
        UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &o)
        
        return (Double(r), Double(g), Double(b), Double(o))
    }
}
