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
    
    
    
    var body: some Scene {
        WindowGroup {
            PostNotesTabView()
        }
        .modelContainer(for: [Note.self])
    }
    
    
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}

#Preview{
    PostNotesTabView()
}
