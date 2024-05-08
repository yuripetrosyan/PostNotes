//
//  AppState.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 03/05/2024.
//

import Foundation
import FirebaseAuth
import SwiftUI
import Firebase

class AppState: ObservableObject {

    @Published var currentUser: User?
    @Published var navigationPath = NavigationPath()
    
    var isLoggedIn: Bool {
        return currentUser != nil
    }
    init() {
        FirebaseApp.configure()
        
        if let currentUser = Auth.auth().currentUser {
            self.currentUser = currentUser
        }
       
    }
    
    
}

