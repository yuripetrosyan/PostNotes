//
//  AuthViewModel.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 02/05/2024.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    
    @Published var isLoading = false
    @Published var isPasswordVisible = false
    @Published var userExists = false
    
    
    func authenticate() {
        
    }
}

