//
//  DetailedViewViewModel.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 28/05/2024.
//

import SwiftUI
import SwiftData

class DetailedViewViewModel: ObservableObject {
    @Published var note: Note
    @Published var selectedCategory: String = ""
    @Environment(\.modelContext) var modelContext
    
    init(note: Note) {
        self.note = note
        self.selectedCategory = note.category
    }
    
    
    func updateNote() {
        // ... other logic ...
        
        do {
            try modelContext.save() // Add 'try' here
        } catch {
            // Handle the error here, e.g., show an alert to the user
            print("Error saving note: \(error)")
        }
    }
}
