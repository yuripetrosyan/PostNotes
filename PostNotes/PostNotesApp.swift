//
//  PostNotesApp.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
import UserNotifications
import SwiftData

@main
struct PostNotesApp: App {
    
    
    
    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge], completionHandler:  { (granted, error) in
            if let error = error {
                
                print(error.localizedDescription)
            }

        }
        )
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            PostNotesTabView()
        }
      //  .modelContainer(for: Note.self)
    }
}


#Preview{
    PostNotesTabView()
}
