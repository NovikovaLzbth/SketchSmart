import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    // Ссылка на коллекцию пользователей
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() { }
    
    func setUser(user: userModel,
                 comlition: @escaping (Result<userModel, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                comlition(.failure(error))
                return
            }
            comlition(.success(user))
        }
    }
}

