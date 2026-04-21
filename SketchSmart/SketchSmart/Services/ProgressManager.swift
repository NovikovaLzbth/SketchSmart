import SwiftUI
import Combine

class ProgressManager: ObservableObject {
    static let shared = ProgressManager()
    
    @Published var completedTests: Set<String> = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showError = false
    
    // ПОРЯДОК ТЕМ (линейная последовательность)
    private let orderedTopics: [String] = [
        "Введение",
        "Точка, линия, пятно",
        "Радуга-помощница",
        "Типографика",
        "Композиция",
        "Сетка, Ритм, Акцент",
        "Идея и Эмоция",
        "Форма и функция",
        "Дизайн-мышление"
    ]
    
    // Соответствие темы и ID теста
    private let topicToTestId: [String: String] = [
        "Точка, линия, пятно": "pointline_test",
        "Радуга-помощница": "rnbw_test",
        "Типографика": "typography_test",
        "Композиция": "composition_test",
        "Сетка, Ритм, Акцент": "grid_test",
        "Идея и Эмоция": "idea_test",
        "Форма и функция": "form_test",
        "Дизайн-мышление": "design_test"
    ]
    
    private init() {}
    
    func loadProgress() {
        isLoading = true
        DatabaseService.shared.getProfile { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.completedTests = Set(user.completedTestsIds)
                    print("Прогресс загружен: \(user.completedTestsIds)")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showError = true
                }
            }
        }
    }
    
    // ГЛАВНАЯ ЛОГИКА: открыта ли тема?
    func isTopicUnlocked(_ topicTitle: String) -> Bool {
        // Введение всегда открыто
        if topicTitle == "Введение" {
            return true
        }
        
        // Находим индекс темы
        guard let currentIndex = orderedTopics.firstIndex(of: topicTitle) else {
            return false
        }
        
        // Предыдущая тема (которая должна быть пройдена)
        let previousTopic = orderedTopics[currentIndex - 1]
        
        // Получаем ID теста ПРЕДЫДУЩЕЙ темы
        guard let previousTestId = topicToTestId[previousTopic] else {
            // Если у предыдущей темы нет теста (только у Введения нет)
            return currentIndex == 1 // Точка-линия открыта, если это вторая тема
        }
        
        // Тема открыта, если ПРЕДЫДУЩИЙ тест пройден
        let isUnlocked = completedTests.contains(previousTestId)
        
        print("🔓 Проверка темы '\(topicTitle)': предыдущий тест '\(previousTestId)' пройден = \(isUnlocked)")
        
        return isUnlocked
    }
    
    // Получить следующий НЕПРОЙДЕННЫЙ тест (для подсказки)
    func getNextRequiredTest() -> String? {
        for topic in orderedTopics {
            if topic == "Введение" { continue }
            
            guard let testId = topicToTestId[topic] else { continue }
            
            if !completedTests.contains(testId) {
                return testId
            }
        }
        return nil // Все тесты пройдены
    }
    
    // Получить название темы по ID теста
    func getTopicTitle(for testId: String) -> String? {
        return topicToTestId.first(where: { $0.value == testId })?.key
    }
    
    // Получить ID теста для темы
    func getTestId(for topicTitle: String) -> String? {
        return topicToTestId[topicTitle]
    }
    
    // Проверить, можно ли проходить этот тест сейчас
    func canTakeTest(_ testId: String) -> Bool {
        guard let topicTitle = getTopicTitle(for: testId) else { return false }
        return isTopicUnlocked(topicTitle)
    }
    
    // Обновить прогресс
    func refreshProgress() {
        loadProgress()
    }
}
