import Foundation
import SwiftUI
import Combine

class TestViewModel: ObservableObject {
    @Published var currentQuestion = 0
    @Published var score = 0
    @Published var showResults = false
    @Published var selectedAnswer: Int?
    @Published var isAnswerCorrect = false
    @Published var showFeedback = false
    @Published var completedTestsCount = 0
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var hasPassedThisTest = false
    
    private let testId: String
    private let questions: [Question]
    private var cancellables = Set<AnyCancellable>()
    
    var totalQuestions: Int {
        questions.count
    }
    
    var currentQuestionData: Question {
        questions[currentQuestion]
    }
    
    var isLastQuestion: Bool {
        currentQuestion == questions.count - 1
    }
    
    var isPerfectScore: Bool {
        score == questions.count
    }

    var isPassingScore: Bool {
        // Проходной балл: 60% от общего количества вопросов
        let passingThreshold = Int(Double(questions.count) * 0.6)
        return score >= passingThreshold
    }
    
    init(testId: String, questions: [Question]) {
        self.testId = testId
        self.questions = questions
    }
    
    func checkAnswer(_ index: Int) {
        selectedAnswer = index
        isAnswerCorrect = index == questions[currentQuestion].correctAnswer
        
        if isAnswerCorrect {
            score += 1
        }
        
        showFeedback = true
    }
    
    func nextQuestion() {
        if currentQuestion < questions.count - 1 {
            currentQuestion += 1
            selectedAnswer = nil
            showFeedback = false
        } else {
            print("РЕЗУЛЬТАТ ТЕСТА '\(testId)': \(score)/\(totalQuestions)")
            
            if isPassingScore && !hasPassedThisTest {
                print("Проходной балл достигнут! Сохраняем результат...")
                updateCompletedTestsCount()
            } else if isPassingScore && hasPassedThisTest {
                print("Тест уже был пройден ранее")
            } else {
                print("Нужно минимум \(Int(Double(totalQuestions) * 0.6)) правильных, получено \(score). Тема не откроется")
            }
            
            showResults = true
        }
    }
    
    func resetTest() {
        currentQuestion = 0
        score = 0
        selectedAnswer = nil
        showResults = false
        showFeedback = false
        loadUserData()
    }
    
    func getResultTitle() -> String {
        if isPerfectScore {
            return "Идеально!"
        } else if isPassingScore {
            return "Хорошо!"
        } else {
            return "Попробуй ещё!"
        }
    }
    
    func getResultMessage() -> String {
            if isPerfectScore {
                return "Тема открыта! Можешь переходить к следующей теме в разделе «Обучение»."
            } else if isPassingScore {
                return "Хороший результат! Попробуй пройти тест идеально, чтобы открыть тему."
            } else {
                return "Перечитай тему и попробуй снова. Удачи!"
            }
        }
    
//    func loadUserData() {
//        isLoading = true
//        DatabaseService.shared.getProfile { [weak self] result in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//                switch result {
//                case .success(let user):
//                    self?.completedTestsCount = user.completedTests
//                    self?.hasPassedThisTest = user.completedTestsIds.contains(self?.testId ?? "")
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                    self?.showError = true
//                }
//            }
//        }
//    }
    
    func loadUserData() {
        isLoading = true
        errorMessage = ""
        showError = false
        
        DatabaseService.shared.getProfile { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.completedTestsCount = user.completedTests
                    self?.hasPassedThisTest = user.completedTestsIds.contains(self?.testId ?? "")
                    print("📊 Загружены данные пользователя: пройдено тестов - \(user.completedTests), текущий тест пройден: \(self?.hasPassedThisTest ?? false)")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showError = true
                    print("❌ Ошибка загрузки данных пользователя: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func updateCompletedTestsCount() {
        guard let userId = AuthService.shared.currentUser?.uid else {
            errorMessage = "Пользователь не авторизован"
            showError = true
            return
        }
        
        isLoading = true
        
        DatabaseService.shared.updateCompletedTests(userId: userId, testId: testId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let newCount):
                    self?.completedTestsCount = newCount
                    self?.hasPassedThisTest = true
                    print("Тест сохранен! Всего пройдено тестов: \(newCount)")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showError = true
                    print("Ошибка сохранения теста: \(error.localizedDescription)")
                }
            }
        }
    }
}
