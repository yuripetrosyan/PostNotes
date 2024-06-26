//
//  ChatViewModel.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import Foundation
import OpenAI
import FirebaseFirestoreSwift
import FirebaseFirestore
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var chat: AppChat?
    @Published var messages: [AppMessage] = []
    @Published var messageText: String = ""
    @Published var selectedModel: ChatModel = .gpt3_5_turbo
    
    let chatId: String
    
    @AppStorage("openai_api_key") var apiKey = ""
    
    let db = Firestore.firestore()
    
    init(chatId: String) {
        self.chatId = chatId
    }
    
    func fetchData(){
        db.collection("chats").document(chatId).getDocument(as: AppChat.self) { result in
            switch result{
            case .success(let success):
                DispatchQueue.main.async{
                    self.chat = success
                }
            case.failure(let faliure):
                print(faliure)
            }
        }
        
        db.collection("chats").document(chatId).collection("message").getDocuments { querySnapshot, error in
            guard let documents = querySnapshot?.documents, !documents.isEmpty else { return }
            
            self.messages = documents.compactMap({ snapshot -> AppMessage? in
                do{
                    var message = try  snapshot.data(as: AppMessage.self)
                    message.id = snapshot.documentID
                    return message
                }catch{
                    return nil
                }
            })
        }
    }
    
    func sendMessage() async throws{
        var newMessage = AppMessage(id: UUID().uuidString, text: messageText, role: .user)
        
        do {
            let documentRef = try storeMessage(message: newMessage)
            newMessage.id = documentRef.documentID
        }catch{
            print(error)
        }
        if messages.isEmpty{
            setupNewChat()
        }
        await MainActor.run { [newMessage] in
            messages.append(newMessage)
            messageText = ""
        }
        
        try await generateResponse(for: newMessage)
        
    }
    
    private func storeMessage(message: AppMessage) throws -> DocumentReference {
        return try db.collection("chats").document(chatId).collection("message").addDocument(from: message)
    }
    
    private func setupNewChat() {
        db.collection("chats").document(chatId).updateData(["model": selectedModel.rawValue])
        DispatchQueue.main.async { [weak self] in
            self?.chat?.model = self?.selectedModel
        }
    }
    
    private func generateResponse(for message: AppMessage) async throws {
        let openAI = OpenAI(apiToken: apiKey)

        // Construct the queryMessages array outside the map closure
        let queryMessages: [ChatQuery.ChatCompletionMessageParam] = messages
                .compactMap { appMessage -> ChatQuery.ChatCompletionMessageParam? in
                    return ChatQuery.ChatCompletionMessageParam(
                        role: appMessage.role == .user ? .user : .assistant,
                        content: appMessage.text
                    )
                }
                // Unwrap the optionals here, providing a default value for nil cases
                .map { $0! }


        // Now create the ChatQuery using the correctly typed queryMessages array
        let query = ChatQuery(messages: queryMessages, model: chat?.model?.model ?? .gpt3_5Turbo)
        for try await result in openAI.chatsStream(query: query){
            guard let newText = result.choices.first?.delta.content else { continue }
            await MainActor.run {
                if let lastMessage = messages.last, lastMessage.role != .user {
                    messages[messages.count - 1].text += newText
                } else {
                    let newMessage = AppMessage(id: result.id, text: newText, role: .assistant)
                    messages.append(newMessage)
                }
            }
        }
        if let lastMessage = messages.last {
            _ = try storeMessage(message: lastMessage)
        }
    }
    
    
    
    
}




struct AppMessage: Identifiable, Codable, Hashable{
   
    @DocumentID var id: String?
    var text: String
    let role: ChatQuery.ChatCompletionMessageParam.Role
    let createdAt: FirestoreDate = FirestoreDate()
}



