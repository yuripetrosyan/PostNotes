//
//  ChatView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    @State private var isShowingInfo = false
    @State private var showChatSelection = true
    var body: some View {
        ZStack{
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
                    //.background(Color(uiColor: .systemGroupedBackground))
                    .listStyle(.plain)
                    
                }
                messageInputView
            }
            
            if isShowingInfo{
                
                ZStack{
                    CustomNotepad()
                    Text("To access the chat add your OpenAI API key in profile settings")
                        .multilineTextAlignment(.leading)
                        .lineLimit(4)
                        .frame(width: 155)
                        .padding(.top, 40)
                        .foregroundStyle(.brandOnly)
                    
                }
                
                
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing, content: {
                Image(systemName: "info.circle.fill")
                    .onTapGesture {
                        withAnimation(Animation.smooth) {
                            isShowingInfo.toggle()
                        }
                        
                    }
            })
        })
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
    
    //MARK: - Chat Selection (Select the model)
    
    var chatSelection: some View{
        Group {
            if showChatSelection, let model = viewModel.chat?.model?.rawValue {
                Text(model)
            } else if showChatSelection {
                Picker(selection: $viewModel.selectedModel) {
                    ForEach(ChatModel.allCases, id: \.self) { model in
                        Text(model.rawValue)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.segmented)
                .padding()
                
                
            }
            
        }
    }
    
    
    //MARK: Message View
    
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
            
        }.contextMenu(ContextMenu(menuItems: {
            Text("Menu Item 1")
            Text("Menu Item 2")
            Text("Menu Item 3")
        }))
    }
    
    var messageInputView: some View {
        HStack{
            RoundedRectangle(cornerRadius: 25.0)
            
            //  .strokeBorder(Color.brandPrimary, lineWidth: 2)
                .frame(height: 50)
                .foregroundStyle(.ultraThinMaterial.shadow(.inner(radius: 2)))
                .shadow(radius: 10, x: 4, y: 6)
                .overlay{
                    
                    TextField("Ask anything...", text: $viewModel.messageText)
                        .padding()
                    //  .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 17))
                        .onSubmit {
                            sendMessage()                }
                    
                }
            
            
            Button {
                sendMessage()
            } label: {
                Image(systemName: "paperplane.fill")
                    .padding()
                    .background(.brandPrimary)
                    .frame(width: 40, height: 40)
                    .fontWeight(.bold)
                    .foregroundStyle(.brandSecondary)
                    .clipShape(Circle())
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    
    //MARK: - Send message function
    
    func sendMessage() {
        Task{
            do{
                try await viewModel.sendMessage()
                showChatSelection = false
            }catch{
                print(error)
            }
        }
    }
}

#Preview {
    ChatView(viewModel: .init(chatId: ""))
}

