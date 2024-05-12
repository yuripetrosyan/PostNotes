//
//  ChatViewModel.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import Foundation
import OpenAI
import FirebaseFirestoreSwift

class ChatViewModel: ObservableObject {
    @Published var chat: AppChat?
    @Published var messages: [AppMessage] = []
    @Published var messageText: String = ""
    @Published var selectedModel: ChatModel = .gpt3_5_turbo
    
    let chatId: String
    
    
    init(chatId: String) {
        self.chatId = chatId
    }
    
    func fetchData(){
//        self.messages = [
//            AppMessage(id: "1", text: "Hello", role: .user, createdAt: Date()),
//            AppMessage(id: "2", text: "I'm good", role: .assistant, createdAt: Date()),
//            AppMessage(id: "3", text: "No", role: .user, createdAt: Date()),
//            AppMessage(id: "4", text: "Yes", role: .assistant, createdAt: Date())
//
//        ]
    }
    
    func sendMessage(){
        var newMessage = AppMessage(id: UUID().uuidString, text: messageText, role: .user)
        messages.append(newMessage)
        messageText = ""
        
    }
    
}

enum ChatRole: String, Codable {  // Make it Codable to be compatible with JSON
    case user = "user"
    case assistant = "assistant"
}


struct AppMessage: Identifiable, Codable, Hashable{
   
    @DocumentID var id: String?
    var text: String
    let role: ChatRole
    let createdAt: FirestoreDate = FirestoreDate()
}



