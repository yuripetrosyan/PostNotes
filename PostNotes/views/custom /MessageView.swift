//
//  MessageView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import SwiftUI

struct MessageView: View {
    
    
    @State var chatMessages: [ChatMessage] = ChatMessage.sampleMessages
    @State var message: ChatMessage
    
    
    var body: some View {
        VStack{
            Text(message.content)
                .padding()
                .frame(minWidth: 30)
                .foregroundStyle(.white)
                .fontWeight(.medium)
                .padding(.vertical, -5)
            //when i send the message -> blue, when the gpt sends -> gray
                .background(Capsule().foregroundStyle(message.sender == .me ? .blue : .gray))
            
            //alignment: me -> trailing, gpt -> leading
                .frame(maxWidth: .infinity, alignment: message.sender == .me ? .trailing : .leading)
                .padding(.horizontal)
                
            
            
            
            
            
            
        }
    }
}

#Preview {
    MessageView(message: ChatMessage.sampleMessages[2])
}
