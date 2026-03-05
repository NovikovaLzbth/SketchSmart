import Foundation

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
                case .failure(let error):
                    print("Error loading completed tests: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    // Текущий уровень
    var currentLevel: Int {
        var level = 1
        var testsNeeded = 2
        var remainingTests = completedTests
        
        while remainingTests >= testsNeeded {
            remainingTests -= testsNeeded
            level += 1
            testsNeeded *= 2
        }
        
        return level
    }
    
    // Прогресс внутри текущего уровня
    var levelProgress: Double {
        var testsPassed = completedTests
        var testsForCurrentLevel = 2
        
        for level in 1..<currentLevel {
            testsPassed -= testsForCurrentLevel
            testsForCurrentLevel *= 2
        }
        
        return Double(testsPassed)
    }
    
    // Общее количество тестов для текущего уровня
    var testsForCurrentLevel: Int {
        if currentLevel == 1 {
            return 2
        }
        
        var testsForLevel = 2
        for _ in 1..<currentLevel {
            testsForLevel *= 2
        }
        return testsForLevel
    }
    
    // Текущий облик
    var currentCharacter: Int {
        var character = 1
        var charactersNeeded = 2
        var remainingCharacter = currentLevel
        
        while remainingCharacter >= charactersNeeded {
            remainingCharacter -= charactersNeeded
            character += 1
            charactersNeeded *= 2
        }
        
        return character
    }
    
    // Прогресс внутри текущего облика
    var characterProgress: Double {
        var characterPassed = currentLevel
        var levelsForCurrentCharacter = 2
        
        for level in 1..<currentCharacter {
            characterPassed -= levelsForCurrentCharacter
            levelsForCurrentCharacter *= 2
        }
        
        return Double(characterPassed)
    }
    
    // Общее количество уровней для текущего облика
    var levelsForCurrentCharacter: Int {
        if currentCharacter == 1 {
            return 2
        }
        
        var levelsForCharacter = 2
        for _ in 1..<currentCharacter {
            levelsForCharacter *= 2
        }
        return levelsForCharacter
    }
    
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
