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

  //  @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack{
          
            

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
            
        }
        
    }
}

#Preview {
    SettingsView()
}
