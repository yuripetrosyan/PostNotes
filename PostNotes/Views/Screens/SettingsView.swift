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
        NavigationStack{
            VStack{
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
                        }

                        //
                        //                    NavigationLink("See Updates") {
                        //                        ExploreList()
                        //                    }
                    }
                    .frame(height: 70)
                    .background(Color("background9").padding(-2000))
                  //  .shadow(color: Color("backgroundShadow4"), radius: 20, x: 0, y: 20)
               
                     Section("OpenAI API key", content: {
                        ProfileView()
                    })
                        
                  
                    
                    Section{
                        Button("Logout"){
                                appState.logout()
                        }.foregroundStyle(.red)
                    }
                    
                    
                }
                
                
                
                
//                Button(action: {
//                    appState.logout()
//                }, label: {
//                    Text("Logout")
//                        .font(.title2)
//                        .fontDesign(.rounded)
//                        .fontWeight(.semibold)
//                        .foregroundStyle(.brandSecondary)
//                })
//                .frame(width: 250, height: 50)
//                .background(LinearGradient(colors: [.brandPrimary, .brandPrimary.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
//                .clipShape(Capsule(style: .continuous))
//                .padding(.bottom, 80)
                
            }
        }
        }
    }
    
    #Preview {
        SettingsView()
    }
