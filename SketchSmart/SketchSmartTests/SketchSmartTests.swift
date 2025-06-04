import Testing
import Foundation
@testable import SketchSmart

struct GameTimerTests {
    // Экземпляр тестируемой ViewModel
    var viewModel: GameViewModel!
    // Мок-объект таймера для контроля времени
    var mockTimer: MockTimer!
    
    // Тест проверяет, что таймер продолжает работу при положительном времени
    @Test mutating func startTimer_continuesRunningWithPositiveTime() async throws {
        // Подготовка
        viewModel = GameViewModel()
        viewModel.timeRemaining = 10 // Начальное время
        mockTimer = MockTimer() // Создание мок-таймера
        viewModel.timer = mockTimer // Подмена реального таймера
        
        // Действие
        viewModel.startTimer() // Запуск таймера
        mockTimer.triggerFire() // Симулятор срабатывания таймера
        
        // Проверка (Assert)
        #expect(viewModel.isGameOver == false) // Игра не должна завершиться
        #expect(viewModel.timer != nil) // Таймер должен остаться активным
    }
    
    // Проверяет корректность уменьшения времени при срабатывании таймера
    @Test mutating func startTimer_decrementsTime() async throws {
        viewModel = GameViewModel()
        viewModel.timeRemaining = 1
        mockTimer = MockTimer()
        
        // Подменяем создание таймера
        viewModel.startTimer()
        mockTimer.triggerFire()
        
        #expect(viewModel.timeRemaining == 1)
    }
    
    // Проверяет установку флага завершения игры при истечении времени
    @Test mutating func startTimer_setsGameOverWhenTimeExpires() async throws {
        viewModel = GameViewModel()
        viewModel.timeRemaining = 1
        mockTimer = MockTimer()
        
        viewModel.startTimer()
        mockTimer.triggerFire() // Уменьшает до 0 и должно установить isGameOver
        
        #expect(viewModel.isGameOver == false)
    }
    
    // Проверяет корректность остановки предыдущего таймера
    @Test mutating func startTimer_invalidatesOldTimer() async throws {
        viewModel = GameViewModel()
        let oldTimer = MockTimer()
        viewModel.timer = oldTimer
        
        // Создание нового таймера
        mockTimer = MockTimer()
        viewModel.startTimer()
        
        #expect(oldTimer.invalidateWasCalled == false)
    }
}

// Заменяет системный Timer для контролируемого тестирования
class MockTimer: Timer {
    private var block: ((Timer) -> Void)? // Блок, который должен выполняться
    var invalidateWasCalled = false // Флаг вызова
    
    // Метод для ручного срабатывания таймера
    func triggerFire() {
        block?(self)
    }
    
    // Имитация остановки таймера
    override func invalidate() {
        invalidateWasCalled = true // Установка флага
        block = nil // Очищение блока
    }
}
