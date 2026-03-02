import Foundation

struct UserModel: Identifiable {
    
    var id: String 
    var name: String
    var phone: String
    var email: String
    var completedTests: Int = 0 // Количество полностью правильно пройденных тестов
    var completedTestsIds: [String] = []
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["email"] = self.email
        repres["completedTests"] = self.completedTests
        repres["completedTestsIds"] = self.completedTestsIds
        
        return repres
    }
}
