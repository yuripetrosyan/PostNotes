//
//  SettingsView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 24/03/2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsViewModel = SettingsViewModel()

  //  @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack{
          
            

            Button(action: {
                
                
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
