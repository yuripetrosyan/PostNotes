//
//  Note.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 03/04/2024.
//

import SwiftUI
import SwiftData



@Model
final class Note {
    //@Attribute(.unique) var id: UUID? // Optional ID for uniqueness (if needed)
    @Attribute var title: String = ""
    @Attribute var content: String = ""
    @Attribute var date: Date = Date()
    @Attribute var category: String = "All Notes" // Default category
    
    @Attribute var imageData: Data? = nil

    init() {} // Empty initializer
}
