//
//  Note.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 03/04/2024.
//

import SwiftUI
import SwiftData
    //Struct representing a single note

//struct Note: Identifiable, Codable {
//    var id = UUID()
//    var title: String
//    var content: String
//}
//class NoteManager {
//    static let shared = NoteManager()
//    private let key = "notes"
//    
//    // Load notes from UserDefaults
//    func loadNotes() -> [Note] {
//        if let data = UserDefaults.standard.data(forKey: key) {
//            if let notes = try? JSONDecoder().decode([Note].self, from: data) {
//                print("Loaded notes:", notes)
//                return notes
//            }
//        }
//        print("No notes loaded")
//        return []
//    }
//    
//    // Save notes to UserDefaults
//    func saveNotes(_ notes: [Note]) {
//        if let data = try? JSONEncoder().encode(notes) {
//            UserDefaults.standard.set(data, forKey: key)
//        }
//    }
//    
//    
//    // Delete a note from the list and save the updated list
//    func deleteNote(_ note: Note, from notes: inout [Note]) {
//        if let index = notes.firstIndex(where: { $0.id == note.id }) {
//            notes.remove(at: index)
//            saveNotes(notes)
//        }
//    }
//}

//struct MockData {
//    
//    static let sampleNote = Note(title: "Holidays", content: "The destination was this and this and that but for the overall this and that we could barely this and that")
//    
//}

@Model
class Note {
    
    var title: String
    var content: String
    var date: Date
    
    init(title: String, content: String, date: Date) {
        self.title = title
        self.content = content
        self.date = date
    }
}
