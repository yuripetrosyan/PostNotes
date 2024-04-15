//
//  Note.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 03/04/2024.
//

import SwiftUI
import SwiftData
    

@Model
class Note {
    
    var title: String = ""
    var content: String = ""
    var date: Date = Date()
    var category: String = "" // Add category property

    init(title: String, content: String, date: Date,  category: String
    ){
        self.title = title
        self.content = content
        self.date = date
        self.category = category // Initialize category

//folders here
    }
}
