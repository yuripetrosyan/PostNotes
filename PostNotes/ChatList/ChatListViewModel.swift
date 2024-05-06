//
//  ChatListViewModel.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 06/05/2024.
//

import Foundation
import SwiftUI

class ChatListViewModel: ObservableObject {
    
    @Published var chats: [AppChat] = []
    @Published var loadingState: ChatListState = .none
    
    func fetchData(){
        self.chats = [
            AppChat(id: "1", topic: "Topic", model: .gpt3_5_turbo, lastMessageSent: Date(), owner: "123"),
            AppChat(id: "2", topic: "Gym", model: .gpt4, lastMessageSent: Date(), owner: "1233"),
            AppChat(id: "3", topic: "Note", model: .gpt3_5_turbo, lastMessageSent: Date(), owner: "1234"),
            AppChat(id: "4", topic: "Health", model: .gpt4, lastMessageSent: Date(), owner: "1423")
        ]
        self.loadingState = .resultsFound
    }
    
}

enum ChatListState {
    case none
    case loading
    case noResults
    case resultsFound
}

struct AppChat: Codable, Identifiable {
    let id: String
    let topic: String?
    let model: ChatModel?
    let lastMessageSent: Date
    let owner: String
    
}


enum ChatModel: String, Codable, CaseIterable, Hashable {
    case gpt3_5_turbo = "GPT 3.5 Turbo"
    case gpt4 = "GPT 4"
    
    var tintColor : Color {
        switch self {
        case .gpt3_5_turbo:
            return .green
        case .gpt4:
            return .purple
        }
    }
}
