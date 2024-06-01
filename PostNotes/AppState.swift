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
    
   // @Published private(set) var isLoggedIn = false // Private(set) to prevent external modification
    
    var isLoggedIn: Bool {
        return currentUser != nil
    }
    
    func logout() {
          do {
              try Auth.auth().signOut()
              currentUser = nil
              navigationPath = NavigationPath() // Reset the navigation stack
          } catch {
              print("Logout Error: ", error)

          }
      }
    
  
    
    init() {
        FirebaseApp.configure()
        
        if let currentUser = Auth.auth().currentUser {
            self.currentUser = currentUser
        }
       
    }
    
    
}

