//
//  PostNotesApp.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
import UserNotifications

@main
struct PostNotesApp: App {
    
    
    
    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge], completionHandler:  { (granted, error) in
            if let error = error {
                
                print(error.localizedDescription)
            }
            //d
        })
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            PostNotesTabView()
        }
    }
}


#Preview{
    PostNotesTabView()
}
