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
    @State private var shadowColor: Color = Color.indigo
    @State private var headerColor: Color = Color("brandPrimary")
    @State private var backgroundAnimationON = true
    
    var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack{
                List{
                    Section{
                        NavigationLink {
                            ExploreList()
                                
                        } label: {
                            HStack{
                                Image("Illustration2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 70)
                                
                                Text("See Updates")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.leading, 10)
                            }
                        }                    }
                   
                    .frame(height: 70)
                    .background(Color("background9").padding(-2000))
                    
                    
                    //MARK: - API Key Settings
                    Section("OpenAI API key", content: {
                        ProfileView()
                    })
                    
                    //MARK: - Customize Notes (Custom Colors)
                    Section("Customize (Coming Soon)"){
                        Toggle(isOn: $backgroundAnimationON) {
                            Text("Backgrorund Animation")
                        }.tint(.indigo)
                        ColorPicker("Header Color", selection: $headerColor)
                        ColorPicker("Shadow Color", selection: $shadowColor)
                       
                    }
                    
                    //MARK: - Logout
                    Section{
                        Button("Logout"){
                                appState.logout()
                        }.foregroundStyle(.red)
                    }.listSectionSpacing(60)
                    
                }.navigationTitle("Settings")
        }
        }
    }
    
    #Preview {
        SettingsView()
    }
