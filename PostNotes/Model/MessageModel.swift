//
//  ChatMessage.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import Foundation


struct Message: Identifiable{
    let id = UUID()
    let content: String
    let dateCreated: Date
    let sender: MessageSender
    
}

enum MessageSender{
    case me
    case gpt
    
}

extension Message{
    static let sampleMessages = [
    
        Message(content: "a message sent by me", dateCreated: Date(), sender: .me),
        Message(content: "a message sent by gpt", dateCreated: Date(), sender: .gpt),
        Message(content: "another message sent by me", dateCreated: Date(), sender: .me),
        Message(content: "aanother message sent by gpt", dateCreated: Date(), sender: .gpt)

    
    
    ]
    
    
}
