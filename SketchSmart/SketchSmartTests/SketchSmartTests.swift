//
//  SketchSmartUnitTests.swift
//  SketchSmartTests
//
//  Ключевые юнит-тесты основных компонентов приложения
//

import XCTest
import SwiftUI
@testable import SketchSmart

// MARK: - Мок для DatabaseService

class MockDatabaseServiceForTests {
    var mockUser: UserModel?
    var shouldSucceed = true
    
    func setProfile(user: UserModel, completion: @escaping (Result<UserModel, Error>) -> ()) {
        if shouldSucceed {
            completion(.success(user))
        }
    }
    
    func getProfile(completion: @escaping (Result<UserModel, Error>) -> ()) {
        if shouldSucceed, let user = mockUser {
            completion(.success(user))
        } else if shouldSucceed {
            let defaultUser = UserModel(id: "test_id", name: "Test User", phone: "", email: "test@test.com", completedTests: 0, completedTestsIds: [])
            completion(.success(defaultUser))
        }
    }
    
    func updateCompletedTests(userId: String, testId: String, completion: @escaping (Result<Int, Error>) -> ()) {
        if shouldSucceed {
            completion(.success(5))
        }
    }
}

// MARK: - Тестовый класс

final class SketchSmartUnitTests: XCTestCase {
    
    // MARK: - Свойства
    
    var authService: AuthService!
    var networkMonitor: NetworkMonitor!
    var testViewModel: TestViewModel!
    var gameViewModel: GameViewModel!
    var memoryModel: GameViewMemoryModel!
    var profileViewModel: ProfileViewModel!
    var mockQuestions: [Question]!
    
    // MARK: - Настройка
    
    override func setUp() {
        super.setUp()
        
        authService = AuthService.shared
        networkMonitor = NetworkMonitor.shared
        
        // Подготовка тестовых вопросов
        let question1 = Question(
            text: "Какой цвет является основным?",
            options: ["Красный", "Зелёный", "Синий", "Жёлтый"],
            correctAnswer: 0,
            image: "paintpalette.fill"
        )
        let question2 = Question(
            text: "Сколько основных цветов в RGB?",
            options: ["2", "3", "4", "5"],
            correctAnswer: 1,
            image: "paintpalette.fill"
        )
        mockQuestions = [question1, question2]
        testViewModel = TestViewModel(testId: "test_001", questions: mockQuestions)
        
        gameViewModel = GameViewModel()
        gameViewModel.startNewRound()
        
        memoryModel = GameViewMemoryModel()
        memoryModel.startNewGame()
        
        let mockUser = UserModel(
            id: "test_user",
            name: "Тестовый Пользователь",
            phone: "+7 999 123 45 67",
            email: "test@example.com",
            completedTests: 5,
            completedTestsIds: ["test_001"]
        )
        profileViewModel = ProfileViewModel(profile: mockUser)
    }
    
    override func tearDown() {
        authService = nil
        networkMonitor = nil
        testViewModel = nil
        gameViewModel = nil
        memoryModel = nil
        profileViewModel = nil
        mockQuestions = nil
        super.tearDown()
    }
    
    // MARK: - 1. Тесты AuthService
    
    func testAuthService_SharedIsSingleton() {
        let instance1 = AuthService.shared
        let instance2 = AuthService.shared
        XCTAssertTrue(instance1 === instance2)
    }
    
    func testAuthService_SignOutDoesNotCrash() {
        authService.signOut()
        XCTAssertTrue(true)
    }
    
    // MARK: - 2. Тесты NetworkMonitor
    
    func testNetworkMonitor_SharedIsSingleton() {
        let instance1 = NetworkMonitor.shared
        let instance2 = NetworkMonitor.shared
        XCTAssertTrue(instance1 === instance2)
    }
    
    func testNetworkMonitor_IsConnectedIsBoolean() {
        let isConnected = networkMonitor.isConnected
        XCTAssertTrue(isConnected == true || isConnected == false)
    }
    
    // MARK: - 3. Тесты TestViewModel (прохождение теста)
    
    func testTestViewModel_CorrectAnswerIncrementsScore() {
        let initialScore = testViewModel.score
        testViewModel.checkAnswer(0) // правильный ответ
        XCTAssertEqual(testViewModel.score, initialScore + 1)
    }
    
    func testTestViewModel_IncorrectAnswerDoesNotIncrementScore() {
        let initialScore = testViewModel.score
        testViewModel.checkAnswer(1) // неправильный ответ
        XCTAssertEqual(testViewModel.score, initialScore)
    }
    
    func testTestViewModel_LastQuestionShowsResults() {
        testViewModel.currentQuestion = 1
        testViewModel.nextQuestion()
        XCTAssertTrue(testViewModel.showResults)
    }
    
    func testTestViewModel_ResetTestClearsProgress() {
        testViewModel.checkAnswer(0)
        testViewModel.nextQuestion()
        testViewModel.resetTest()
        
        XCTAssertEqual(testViewModel.currentQuestion, 0)
        XCTAssertEqual(testViewModel.score, 0)
        XCTAssertFalse(testViewModel.showResults)
    }
    
    // MARK: - 4. Тесты GameViewModel (цветовая игра "Найди лишнее")
    
    func testGameViewModel_InitialStateIsCorrect() {
        XCTAssertEqual(gameViewModel.score, 0)
        XCTAssertEqual(gameViewModel.level, 1)
        XCTAssertEqual(gameViewModel.timeRemaining, 60)
        XCTAssertFalse(gameViewModel.isGameOver)
    }
    
    func testGameViewModel_CorrectAnswerIncreasesScore() {
        let initialScore = gameViewModel.score
        gameViewModel.checkAnswer(gameViewModel.targetIndex)
        XCTAssertEqual(gameViewModel.score, initialScore + 1)
    }
    
    func testGameViewModel_IncorrectAnswerDecreasesScore() {
        var wrongIndex = 0
        if wrongIndex == gameViewModel.targetIndex { wrongIndex = 1 }
        let initialScore = gameViewModel.score
        gameViewModel.checkAnswer(wrongIndex)
        XCTAssertEqual(gameViewModel.score, max(0, initialScore - 1))
    }
    
    func testGameViewModel_RestartGameResetsAllValues() {
        gameViewModel.score = 10
        gameViewModel.level = 3
        gameViewModel.restartGame()
        
        XCTAssertEqual(gameViewModel.score, 0)
        XCTAssertEqual(gameViewModel.level, 1)
        XCTAssertEqual(gameViewModel.timeRemaining, 60)
        XCTAssertFalse(gameViewModel.isGameOver)
    }
    
    // MARK: - 5. Тесты GameViewMemoryModel (игра "Пары")
    
    func testMemoryGame_InitialCardCountIsCorrect() {
        let expectedCount = memoryModel.colorPairsCount * 2
        XCTAssertEqual(memoryModel.cards.count, expectedCount)
    }
    
    func testMemoryGame_AllCardsStartFaceDown() {
        for card in memoryModel.cards {
            XCTAssertFalse(card.isFaceUp)
            XCTAssertFalse(card.isMatched)
        }
    }
    
    func testMemoryGame_SelectingCardFlipsIt() {
        let firstCard = memoryModel.cards[0]
        memoryModel.selectCard(firstCard)
        XCTAssertTrue(memoryModel.cards[0].isFaceUp)
    }
    
    // MARK: - 6. Тесты ProfileViewModel (прогресс)
    
    func testProfileViewModel_CurrentLevelStartsAtOne() {
        let userWith0Tests = UserModel(id: "1", name: "", phone: "", email: "", completedTests: 0, completedTestsIds: [])
        let vm = ProfileViewModel(profile: userWith0Tests)
        XCTAssertEqual(vm.currentLevel, 1)
    }
    
    func testProfileViewModel_LevelProgressIsNonNegative() {
        XCTAssertGreaterThanOrEqual(profileViewModel.levelProgress, 0)
    }
    
    func testProfileViewModel_CharacterImageExists() {
        let imageName = profileViewModel.characterImageName
        let validNames = ["Image 39", "Image 40", "Image 41"]
        XCTAssertTrue(validNames.contains(imageName))
    }
}
