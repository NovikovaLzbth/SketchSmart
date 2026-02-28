import Foundation
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
