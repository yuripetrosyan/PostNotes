//
//  ChatMessage.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import Foundation


struct ChatMessage{
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
    
    
}


enum MessageSender{
    case me
    case gpt
    
}


extension ChatMessage{
    static let sampleMessages = [
    
        ChatMessage(id: UUID().uuidString, content: "a message sent by me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "a message sent by gpt", dateCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "another message sent by me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "aanother message sent by gpt", dateCreated: Date(), sender: .gpt)

    
    
    ]
    
    
}
