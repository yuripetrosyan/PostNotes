//
//  ChatView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    
    var body: some View {
        
        VStack{
            chatSelection
            ScrollViewReader { scrollView in
                List(viewModel.messages) { message in
                    messageView(for: message)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .id(message.id)
                        .onChange(of: viewModel.messages){
                        newValue in scrollToButtom(scrollView: scrollView)
                        }
                }
                .navigationTitle(viewModel.chat?.topic ?? "New Chat")
                .background(Color(uiColor: .systemGroupedBackground))
                .listStyle(.plain)
            }
            messageInputView
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.fetchData()
        }
    }
    
    
    func scrollToButtom(scrollView: ScrollViewProxy){
        guard !viewModel.messages.isEmpty, let lastMessage = viewModel.messages.last else { return }
       
        withAnimation {
            scrollView.scrollTo(lastMessage.id)
        }
       
        
        
    }
    var chatSelection: some View{
        Group{
            if let model = viewModel.chat?.model?.rawValue{
                Text(model)
            }else{
                Picker(selection: $viewModel.selectedModel) {
                    ForEach(ChatModel.allCases, id: \.self) {
                        model in
                        Text(model.rawValue)
                    }
                } label: {
                    Text("")
                    // Color(.red)
                }
                
                .pickerStyle(.segmented)
                .padding()
                
            }
            
        }
    }
    
    func messageView(for message: AppMessage) -> some View{
        HStack{
            if (message.role == .user){
                Spacer()
            }
            
            Text(message.text)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .foregroundStyle(message.role == .user ? .brandSecondary : .brandPrimary)
                .background(message.role == .user ? .brandPrimary : .brandSecondary)
                .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
            if (message.role == .assistant){
                Spacer()
            }
            
        }
    }
    
    var messageInputView: some View {
        HStack{
            TextField("Ask anything...", text: $viewModel.messageText)
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 17))
                .onSubmit {
                    viewModel.sendMessage()
                }
            Button {
                viewModel.sendMessage()
            } label: {
                Text("Send")
                    .padding()
                    .background(.brandPrimary)
                    .fontWeight(.bold)
                    .foregroundStyle(.brandSecondary)
                    .clipShape(RoundedRectangle(cornerRadius: 17))
            }
            
        }.padding()
    }
}

#Preview {
    ChatView(viewModel: .init(chatId: ""))
}
