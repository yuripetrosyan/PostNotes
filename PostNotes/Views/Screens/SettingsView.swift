//
//  SettingsView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 24/03/2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsViewModel = SettingsViewModel()
    @EnvironmentObject var appState: AppState
    var authViewModel = AuthViewModel()
  //  @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack{
            Text("Hi \(authViewModel.emailText)")
                .font(.title)
            ProfileView().scrollContentBackground(.hidden)

            Button(action: {
                appState.logout()
            }, label: {
                Text("Logout")
                    .font(.headline)
                    .foregroundStyle(.brandSecondary)
            })
            .padding()
            .background(.brandPrimary)
            .clipShape(Capsule(style: .continuous))
            .padding(.bottom, 70)

            
        }
        
    }
}

#Preview {
    SettingsView()
}
