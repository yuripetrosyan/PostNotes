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
    
    var body: some Scene {
        
        
        WindowGroup {
            if appState.isLoggedIn{
                PostNotesTabView()
                    .environmentObject(FoldersViewModel.shared)
            }else {
                AuthView()
                    .environmentObject(appState)
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
