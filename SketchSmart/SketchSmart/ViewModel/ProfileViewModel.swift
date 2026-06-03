import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profile: UserModel
    @Published var completedTests = 0
    @Published var errorMessage: String?
    
    init(profile: UserModel) {
        self.profile = profile
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    print(user.name)
                    self.profile = user
                case .failure(let error):
                    print(error.localizedDescription)
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.profile = user
                    self.completedTests = user.completedTests
                case .failure(let error):
                    print(error.localizedDescription)
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func formatPhoneNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }
        
        var result = ""
        let mask = "(XXX) XXX-XX-XX"
        var index = digits.startIndex
        
        for ch in mask where index < digits.endIndex {
            if ch == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func loadData() {
        DatabaseService.shared.getProfile { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.completedTests = user.completedTests
                    self.profile = user
                    print("📊 Пройдено тестов: \(user.completedTests)")
                    print("📍 Текущий уровень: \(self.currentLevel)")
                    print("🎭 Текущий облик: \(self.currentCharacter)")
                case .failure(let error):
                    print("Error loading completed tests: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    // MARK: - Уровни
    
    // Текущий уровень
    var currentLevel: Int {
        switch completedTests {
        case 0:
            return 1
        case 1:
            return 2
        case 2...4:
            return 3
        default: // 5-8 тестов
            return 4
        }
    }
    
    // Прогресс внутри текущего уровня (0.0 - 1.0)
    var levelProgress: Double {
        switch currentLevel {
        case 1:
            // 0 тестов из 1 для перехода на 2 уровень
            return Double(completedTests) / 1.0
        case 2:
            // На 2 уровне: пройден 1 тест, для перехода на 3 нужно еще 2 теста (всего 3)
            let testsInThisLevel = completedTests - 1
            return Double(testsInThisLevel) / 2.0
        case 3:
            // На 3 уровне: от 2 до 4 тестов, для перехода на 4 нужно 3 теста в этом уровне
            let testsInThisLevel = completedTests - 2
            return Double(testsInThisLevel) / 3.0
        case 4:
            // На 4 уровне: от 5 до 8 тестов
            let testsInThisLevel = completedTests - 5
            return Double(testsInThisLevel) / 4.0
        default:
            return 1.0
        }
    }
    
    // Общее количество тестов для текущего уровня
    var testsForCurrentLevel: Int {
        switch currentLevel {
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 3
        case 4:
            return 4
        default:
            return 1
        }
    }
    
    // MARK: - Облики
    
    // Текущий облик
    var currentCharacter: Int {
        switch currentLevel {
        case 1:
            return 1 // 1-й облик
        case 2...3:
            return 2 // 2-й облик (с уровня 2)
        default: // уровень 4
            return 3 // 3-й облик (с уровня 4)
        }
    }
    
    // Прогресс внутри текущего облика (0.0 - 1.0)
    var characterProgress: Double {
        switch currentCharacter {
        case 1:
            // 1 облик: только уровень 1
            return currentLevel == 1 ? 0.5 : 1.0
        case 2:
            // 2 облик: уровни 2 и 3
            let levelsInThisCharacter = currentLevel - 1 // 1 для уровня 2, 2 для уровня 3
            return Double(levelsInThisCharacter) / 2.0
        case 3:
            // 3 облик: с уровня 4
            let levelsInThisCharacter = currentLevel - 3
            return Double(min(levelsInThisCharacter, 2)) / 2.0
        default:
            return 1.0
        }
    }
    
    // Общее количество уровней для текущего облика
    var levelsForCurrentCharacter: Int {
        switch currentCharacter {
        case 1:
            return 1
        case 2:
            return 2 // 2 уровня (2 и 3)
        case 3:
            return 2 // 2 уровня (4 и дальше)
        default:
            return 1
        }
    }
    
    // Изображение облика
    var characterImageName: String {
        switch currentCharacter {
        case 1:
            return "Image 39" // 1-й облик
        case 2:
            return "Image 40" // 2-й облик
        case 3:
            return "Image 41" // 3-й облик
        default:
            return "Image 41"
        }
    }
}
