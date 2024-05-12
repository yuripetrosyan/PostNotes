//
//  ProfileView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State var apiKey: String = UserDefaults.standard.string(forKey: "openai_api_key") ?? ""
    var body: some View {
        List{
            Section("OpenAI API Key") {
                TextField("Enter key", text: $apiKey) {
                    UserDefaults.standard.setValue(apiKey, forKey: "openai_api_key")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
