//
//  ChatView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import SwiftUI
import SwiftData

struct ChatView: View {
    @Environment(\.modelContext) var context
    @StateObject var viewModel: ChatViewModel
    @State private var isShowingInfo = false
    @State private var showChatSelection = true
    @State private var showSaveConfirmation = false
    
    
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
        
        
        .overlay(
                   Text("Saved!")
                       .opacity(showSaveConfirmation ? 1 : 0) // Show/hide based on state
                       .offset(y: -20) // Position above the message
                       .animation(.easeInOut, value: showSaveConfirmation)
               ) // Overlay the confirmation text
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
                .onTapGesture { // Handle tap on AI message
                    if message.role == .assistant {
                        saveNote(content: message.text)
                        // Show the save confirmation
                        withAnimation {
                            showSaveConfirmation = true
                        }
                        // Hide it after a short delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // Adjust the delay as needed
                            withAnimation {
                                showSaveConfirmation = false
                            }
                        }
                    }
                }
            if (message.role == .assistant){
                Spacer()
            }
            
        }
        
        
    }
    
    //MARK: - Save Note
    
    func saveNote(content: String) {
        let newNote = Note() // Create the note
        context.insert(newNote)     // Insert into context
        newNote.content = content
        newNote.date = Date()
        
        do {
            try context.save()
            
        } catch {
            print("Error saving note: \(error)")
        }
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
                
                    .foregroundColor(.brandPrimary)
                    .padding()
                    .background(.ultraThinMaterial.shadow(.inner(radius: 1))).colorInvert()
                    .shadow(radius: 10, x: 4, y: 6)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                    .fontWeight(.bold)
                
                
                
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

