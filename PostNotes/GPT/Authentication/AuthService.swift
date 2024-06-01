import Foundation
import FirebaseFirestore
import FirebaseAuth

class AuthService {
    let db = Firestore.firestore()
    
    // Check if a user with a specified email exists in our database
    func checkUserExists(email: String) async throws -> Bool {
        let documentSnapshot = db.collection("users").whereField("email", isEqualTo: email).count
        let count = try await documentSnapshot.getAggregation(source: .server).count
        return Int(truncating: count) > 0
    }
    
    //    func login(email: String, password: String) async throws -> AuthDataResult? {
    //        guard !password.isEmpty else { return nil }
    //
    //        return try await Auth.auth().signIn(withEmail: email, password: password)
    //    }
    //
    //    func createUser(withEmail email: String, password: String) async throws {
    //        try await Auth.auth().createUser(withEmail: email, password: password)
    //    }
    //}
    func login(email: String, password: String, userExists: Bool) async throws -> AuthDataResult? {
        guard !password.isEmpty else { return nil }
        
        if userExists {
            return try await Auth.auth().signIn(withEmail: email, password: password)
        } else {
            return try await Auth.auth().createUser(withEmail: email, password: password)
        }
        
    }
    
    func login2(email: String, password: String) async throws -> AuthDataResult? {
        guard !password.isEmpty else { return nil }
        return try await Auth.auth().signIn(withEmail: email, password: password)

    }
    
    
}
