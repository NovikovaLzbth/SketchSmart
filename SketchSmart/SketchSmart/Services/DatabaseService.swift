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
    
    func setProfile(user: UserModel, completion: @escaping (Result<UserModel, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(user))
        }
    }
    
    func getProfile(completion: @escaping (Result<UserModel, Error>) -> ()) {
        guard let userId = AuthService.shared.currentUser?.uid else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])))
            return
        }
        
        usersRef.document(userId).getDocument { docSnapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let snap = docSnapshot, snap.exists else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User document not found"])))
                return
            }
            
            guard let data = snap.data() else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data found"])))
                return
            }
            
            guard let id = data["id"] as? String,
                  let userName = data["name"] as? String,
                  let phone = data["phone"] as? String,
                  let email = data["email"] as? String else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])))
                return
            }
            
            let completedTests = data["completedTests"] as? Int ?? 0
            let completedTestsIds = data["completedTestsIds"] as? [String] ?? []
            
            let user = UserModel(id: id,
                                 name: userName,
                                 phone: phone,
                                 email: email,
                                 completedTests: completedTests,
                                 completedTestsIds: completedTestsIds)
            
            completion(.success(user))
        }
    }
    
    // Метод для обновления счетчика тестов
    func updateCompletedTests(userId: String, testId: String, completion: @escaping (Result<Int, Error>) -> ()) {
        let userRef = usersRef.document(userId)
        
        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let userDocument: DocumentSnapshot
            do {
                try userDocument = transaction.getDocument(userRef)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            guard let data = userDocument.data() else {
                return nil
            }
            
            var completedTestsIds = data["completedTestsIds"] as? [String] ?? []
            let oldCompletedTests = data["completedTests"] as? Int ?? 0
            
            // Проверка, проходил ли пользователь этот тест раньше
            if completedTestsIds.contains(testId) {
                // Тест уже был пройден
                return oldCompletedTests
            } else {
                // Новый тест, увеличение счетчика
                completedTestsIds.append(testId)
                let newCompletedTests = oldCompletedTests + 1
                
                transaction.updateData([
                    "completedTests": newCompletedTests,
                    "completedTestsIds": completedTestsIds
                ], forDocument: userRef)
                
                return newCompletedTests
            }
        }) { (object, error) in
            if let error = error {
                completion(.failure(error))
            } else if let newCount = object as? Int {
                completion(.success(newCount))
            }
        }
    }
}
