//
//  ProfileView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var buttonIsGreen = false
    @State var apiKey: String = UserDefaults.standard.string(forKey: "openai_api_key") ?? ""
    var body: some View {
            
                TextField("OpenAI API Key", text: $apiKey) {
                    UserDefaults.standard.setValue(apiKey, forKey: "openai_api_key")
                }
        Button("Save") {
            
            UserDefaults.standard.setValue(apiKey, forKey: "openai_api_key")
        }
        .onTapGesture  {
            withAnimation(.smooth){
                buttonIsGreen = true
            }
        }
        .foregroundStyle(buttonIsGreen ? .green : .blue)
        .fontWeight(buttonIsGreen ? .semibold : .regular)
            
        
    }
}

#Preview {
    ProfileView()
}
