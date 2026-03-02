import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: UserModel
    
    init(profile: UserModel) {
        self.profile = profile
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.profile = user
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // Шаблон для ввода номера телефона
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
}

