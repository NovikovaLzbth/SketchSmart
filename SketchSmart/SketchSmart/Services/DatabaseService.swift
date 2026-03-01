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
    
    func setProfile(user: UserModel,
                 comlition: @escaping (Result<UserModel, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                comlition(.failure(error))
                return
            }
            comlition(.success(user))
        }
    }
    
    func getProfile(completion: @escaping (Result<UserModel, Error>) -> ()) {
        
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let id = data["id"] as? String else { return }
            guard let userName = data["name"] as? String else { return }
            guard let phone = data["phone"] as? String else { return }
            guard let email = data["email"] as? String else { return }
            
            let user = UserModel(id: id,
                                 name: userName,
                                 phone: phone,
                                 email: email)
            
            completion(.success(user))
            
        }
    }
}

