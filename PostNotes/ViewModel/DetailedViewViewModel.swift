//
//  DetailedViewViewModel.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 28/05/2024.
//

import Foundation
import OpenAI
import FirebaseFirestoreSwift
import FirebaseFirestore
import SwiftUI


class DetailedViewViewModel: ObservableObject {
    @Published var note: Note
    @Published var selectedCategory: String = ""
    @Environment(\.modelContext) var modelContext
    @AppStorage("openai_api_key") var apiKey = ""
    @Published var gptReview: String = ""

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

    private func performChatQuery(with prompt: String) async throws -> String {
        let openAI = OpenAI(apiToken: apiKey)
        let queryMessages: [ChatQuery.ChatCompletionMessageParam] = [
            ChatQuery.ChatCompletionMessageParam(role: .user, content: prompt)
        ].compactMap { $0 } // Ensure no optional values

        let query = ChatQuery(messages: queryMessages, model: .gpt3_5Turbo)

        var responseText = ""
        for try await result in openAI.chatsStream(query: query) {
            if let newText = result.choices.first?.delta.content {
                responseText += newText
            }
        }
        return responseText
    }

    func analyzeText() async throws -> String {
        let prompt = "Analyze the following text:\n\n\(note.content)"
        return try await performChatQuery(with: prompt)
    }

    func summarizeText() async throws -> String {
        let prompt = "Summarize the following text:\n\n\(note.content)"
        return try await performChatQuery(with: prompt)
    }

    func correctText() async throws -> String {
        let prompt = "Correct the following text for any grammatical errors:\n\n\(note.content)"
        return try await performChatQuery(with: prompt)
    }

    // New methods to update the state
    @MainActor
    func analyzeNoteContent() async {
        do {
            let result = try await analyzeText()
            DispatchQueue.main.async {
                self.gptReview = result
            }
        } catch {
            print("Error analyzing text: \(error)")
        }
    }

    @MainActor
    func summarizeNoteContent() async {
        do {
            let result = try await summarizeText()
            DispatchQueue.main.async {
                self.gptReview = result
            }
        } catch {
            print("Error summarizing text: \(error)")
        }
    }

    @MainActor
    func correctNoteContent() async {
        do {
            let result = try await correctText()
            DispatchQueue.main.async {
                self.gptReview = result
            }
        } catch {
            print("Error correcting text: \(error)")
        }
    }
}
