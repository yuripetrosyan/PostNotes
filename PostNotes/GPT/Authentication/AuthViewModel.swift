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
    
    let authService = AuthService()
    func authenticate(appState: AppState) {
        isLoading = true
        Task {
            do {
                if isPasswordVisible {
                    let result = try await authService.login(email: emailText, password: passwordText, userExists: userExists)
                    await MainActor.run(body: {
                        guard let result = result else { return }
                        // Update the app state
                        appState.currentUser = result.user
                        
                    })
                } else {
                    userExists = try await authService.checkUserExists(email: emailText)
                    isPasswordVisible = true
                }
                isLoading = false
            } catch {
                print(error)
                await MainActor.run{
                    isLoading = false
                }
               
            }
        }
    }
    
    func authenticate2(appState: AppState) {
        isLoading = true
        Task {
            do {
                if isPasswordVisible {
                    let result = try await authService.login2(email: emailText, password: passwordText)
                    await MainActor.run(body: {
                        guard let result = result else { return }
                        // Update the app state
                        appState.currentUser = result.user
                        
                    })
                } else {
                    userExists = try await authService.checkUserExists(email: emailText)
                    isPasswordVisible = true
                }
                isLoading = false
            } catch {
                print(error)
                await MainActor.run{
                    isLoading = false
                }
               
            }
        }
    }
    
    
}

