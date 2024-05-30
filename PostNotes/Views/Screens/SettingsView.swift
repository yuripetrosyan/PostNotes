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
    
    
    var body: some View {
        
        VStack{
            List{
                
                Section{
                    ProfileView()
                }
                    
                
                NavigationLink("See Updates") {
                    ExploreList()
                }
                }
                
                
            
                Button(action: {
                    appState.logout()
                }, label: {
                    Text("Logout")
                        .font(.title2)
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                        .foregroundStyle(.brandSecondary)
                })
                .frame(width: 250, height: 50)
                .background(LinearGradient(colors: [.brandPrimary, .brandPrimary.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule(style: .continuous))
                .padding(.bottom, 80)
                
                
            }
            
        }
    }
    
    #Preview {
        SettingsView()
    }
