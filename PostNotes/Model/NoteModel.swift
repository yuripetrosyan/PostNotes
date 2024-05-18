//
//  Note.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 03/04/2024.
//

import SwiftUI
import SwiftData
    

//
//@Model
//class Note {
//    
//    var title: String = ""
//    var content: String = ""
//    var date: Date = Date()
//    var category: String = "" // Add category property
//
//    init(title: String, content: String, date: Date,  category: String
//    ){
//        self.title = title
//        self.content = content
//        self.date = date
//        self.category = category // Initialize category
//
////folders here
//    }
//}


@Model
final class Note {
    //@Attribute(.unique) var id: UUID? // Optional ID for uniqueness (if needed)
    @Attribute var title: String = ""
    @Attribute var content: String = ""
    @Attribute var date: Date = Date()
    @Attribute var category: String = "All Notes" // Default category

    init() {} // Empty initializer
}
