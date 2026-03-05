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
        score >= questions.count / 2
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
            showResults = true
            
            if isPerfectScore {
                updateCompletedTestsCount()
            }
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
    
    func loadUserData() {
        isLoading = true
        DatabaseService.shared.getProfile { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.completedTestsCount = user.completedTests
                    self?.hasPassedThisTest = user.completedTestsIds.contains(self?.testId ?? "")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showError = true
                }
            }
        }
    }
    
    func updateCompletedTestsCount() {
        guard let userId = AuthService.shared.currentUser?.uid else { return }
        
        isLoading = true
        
        DatabaseService.shared.updateCompletedTests(userId: userId, testId: testId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let newCount):
                    self?.completedTestsCount = newCount
                    self?.hasPassedThisTest = true
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showError = true
                }
            }
        }
    }
}
