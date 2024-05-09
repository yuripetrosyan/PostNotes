//
//  AuthService.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 02/05/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class AuthService {
    
    let db = Firestore.firestore() //Access our database

    
    //Check if a user with a specified email exists in our database
    func checkUserExists(email: String) async throws -> Bool{
        let documentSnapshot = db.collection("users").whereField("email", isEqualTo: email).count
        let count = try await documentSnapshot.getAggregation(source: .server).count
        return Int(truncating: count) > 0
    }
    
    func login(email: String, password: String, userExists: Bool) async throws -> AuthDataResult? {
        
        guard !password.isEmpty else { return nil }
        
        if userExists {
            return try await Auth.auth().signIn(withEmail: email, password: password)
        } else {
            return try await Auth.auth().createUser(withEmail: email, password: password)
        }
        
    }
    
}
                                                                                          
