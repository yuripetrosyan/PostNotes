//
//  ChatListViewModel.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 06/05/2024.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import OpenAI

class ChatListViewModel: ObservableObject {
    
    @Published var chats: [AppChat] = []
    @Published var mockChats: [AppChat] = [
        AppChat(id: "1", topic: "Topic", model: .gpt3_5_turbo, lastMessageSent: FirestoreDate(), owner: "123"),
        AppChat(id: "2", topic: "Gym", model: .gpt4, lastMessageSent:  FirestoreDate(), owner: "1233"),
        AppChat(id: "3", topic: "Note", model: .gpt3_5_turbo, lastMessageSent:  FirestoreDate(), owner: "1234"),
        AppChat(id: "4", topic: "Health", model: .gpt4, lastMessageSent:  FirestoreDate(), owner: "1423")
    
    ]
    @Published var loadingState: ChatListState = .none
    @Published var isShowingProfileView = false
    
    private let db = Firestore.firestore()
    
    func fetchData(user: String?){

        
        if loadingState == .none {
            loadingState = .loading
            db.collection("chats").whereField("owner", isEqualTo: user ?? "").addSnapshotListener{ [weak self] querySnapshot, error in
                guard let self = self, let documents = querySnapshot?.documents, !documents.isEmpty else {
                    self?.loadingState = .noResults
                    return
                }
                
                self.chats = documents.compactMap({ snapshot -> AppChat? in
                    return try? snapshot.data(as: AppChat.self)
                })
                .sorted(by: {$0.lastMessageSent > $1.lastMessageSent})
                self.loadingState = .resultsFound
            }
        }
    }
    
    
 
    
    
    func createChat(user: String?) async throws -> String{
        let document = try await db.collection("chats").addDocument(data: ["lastMessageSent": Date(), "owner": user ?? "" ])
        return document.documentID
        
    }
    
    func showProfile(){
        isShowingProfileView = true
    }
    
    func deleteChate(chat: AppChat){
        guard let id = chat.id else {return}
        db.collection("chats").document(id).delete()
    }
    
}

enum ChatListState {
    case none
    case loading
    case noResults
    case resultsFound
}

struct AppChat: Codable, Identifiable {
    @DocumentID var id: String?
    var topic: String?
    var model: ChatModel?
    let lastMessageSent: FirestoreDate
    let owner: String
    
    
    //how long ago the message was sent
    var lastMessageTimeAgo: String{
        let now = Date()
        let components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: lastMessageSent.date, to: now)
        
        let timeUnits: [(value: Int?, unit: String)] = [
            (components.year, "year"),
            (components.month, "month"),
            (components.day, "day"),
            (components.hour, "hour"),
            (components.minute, "minute"),
            (components.second, "second")
        ]        
        
        for timeUnit in timeUnits {
            if let value = timeUnit.value, value > 0 {
                return "\(value) \(timeUnit.unit)\(value == 1 ? "" : "s") ago"
            }
        }
        
        return "just now"
    }
}

enum ChatModel: String, Codable, CaseIterable, Hashable {
    case gpt3_5_turbo = "GPT 3.5 Turbo"
    case gpt4 = "GPT 4"
    
  //case gpt4o here
    
    
    var tintColor : Color {
        switch self {
        case .gpt3_5_turbo:
            return .green
        case .gpt4:
            return .purple
     
        }
        
    }
    var model: Model {
        switch self{
        case .gpt3_5_turbo:
            return .gpt3_5Turbo
        case .gpt4:
            return .gpt4
      
        }
    }
}

struct FirestoreDate: Codable, Hashable, Comparable {
    
    
    var date: Date
    
    init(_ date: Date = Date()) {
        self.date = date
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let timestamp = try container.decode(Timestamp.self)
        date = timestamp.dateValue()
    }
    
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        let timestamp = Timestamp(date: date)
        try container.encode(timestamp)
    }
    
    static func < (lhs: FirestoreDate, rhs: FirestoreDate) -> Bool {
        lhs.date > rhs.date
    }
}
