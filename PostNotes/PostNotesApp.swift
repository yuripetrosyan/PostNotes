//
//  PostNotesApp.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI

@main
struct PostNotesApp: App {
    var body: some Scene {
        WindowGroup {
            PostNotesTabView()
        }
    }
}


#Preview{
    PostNotesTabView()
}
