//
//  MessageStore.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 16/04/2024.
//

import Foundation


class MessageStore: ObservableObject {
    @Published var messages: [Message] = []


    func deleteMessage(with id: UUID) {
       
        
    }
}
