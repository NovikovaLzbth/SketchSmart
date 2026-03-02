import Foundation

struct UserModel: Identifiable {
    
    var id: String 
    var name: String
    var phone: String
    var email: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["email"] = self.email
        
        return repres
    }
}
