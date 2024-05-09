//
//  ChatView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import SwiftUI

struct ChatView: View {
    var viewModel: ChatViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ChatView(viewModel: .init(chatId: ""))
}
