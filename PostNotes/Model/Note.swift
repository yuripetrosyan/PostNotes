//
//  Note.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 03/04/2024.
//

import SwiftUI

// Struct representing a single note
struct Note: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}


class NoteManager {
    static let shared = NoteManager()
    private let key = "notes"
    
    // Load notes from UserDefaults
    func loadNotes() -> [Note] {
        if let data = UserDefaults.standard.data(forKey: key) {
            if let notes = try? JSONDecoder().decode([Note].self, from: data) {
                print("Loaded notes:", notes)
                return notes
            }
        }
        print("No notes loaded")
        return []
    }
    
    // Save notes to UserDefaults
    func saveNotes(_ notes: [Note]) {
        if let data = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

