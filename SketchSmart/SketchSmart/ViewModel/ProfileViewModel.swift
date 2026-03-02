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
}
