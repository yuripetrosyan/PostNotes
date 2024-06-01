//
//  PostNotesApp.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
import SwiftData

@main
 struct PostNotesApp: App {
  
    @ObservedObject var appState: AppState = AppState()
    @State private var isLaunchViewPresented = true

     
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appState.navigationPath) {
                if !isLaunchViewPresented{
                    if appState.isLoggedIn {
                        PostNotesTabView()
                            .environmentObject(appState)
                    } else {
                        AuthView()
                            .environmentObject(appState)
                    }
                } else {
                    LaunchAnimation(isLaunchViewPresented: $isLaunchViewPresented)
                }
                
            }
        }
        .modelContainer(for: [Note.self])
    }
    
   // init() {
       // print(URL.applicationSupportDirectory.path(percentEncoded: false))
    //}
}

#Preview{
    PostNotesTabView()
}
