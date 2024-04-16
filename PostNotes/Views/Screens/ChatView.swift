//
//  ChatView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageText = ""
    @State private var isShowingSuggestions = true
    @State var chatMessages: [Message] = []
    @EnvironmentObject var store: MessageStore // Or pass down through views
    @State private var sheetisPresented = true
    
    var body: some View {
      //  NavigationStack{
     
            VStack{
                // Button
                HStack{
                    
                    Image(.sun)
                        .resizable()
                        .frame(width: 45, height: 45)
                    
                    VStack(alignment: .leading){
                        Text("AI Assistant")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundStyle(.white.opacity(0.9))
                        
                        Text("Premium Subscriber")
                        //.font(.system(size: 17))
                            .font(.footnote)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundStyle(.indigo)
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.white.opacity(0.6))
                        
                    })
                    
                    
                    
                    
                    
                }
                .padding()
                .offset(y: 30)
                .frame(height: 150)
                .background(.brandOnly)
                
                
                //Spacer()
                
                ZStack{
                    VStack{
                        ScrollView{
                            LazyVStack{
                                ForEach(chatMessages, id: \.id){
                                    message in MessageView(message: message).contextMenu(ContextMenu(menuItems: {
                                        Button(role: .destructive) {
                                            // Filter to update UI immediately
                                            chatMessages = chatMessages.filter { $0.id != message.id }
                                            
                                            // Call the store to handle SwiftData persistence
                                            store.deleteMessage(with: message.id)
                                        }
                                        
                                    label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                        
                                        
                                        
                                        
                                    }))}
                            }.padding(.top, 40)
                        }.frame(maxWidth: .infinity, maxHeight: 420)
                        
                    }
                    
                    if chatMessages.count == 0{
                        VStack (spacing: 20){
                            
                            Spacer()
                            
                            SuggestionView(messageSent: $messageText, suggestionTitle: "Brainstorm names", suggestionContent: "for my fantasy football team with a frog theme")
                            SuggestionView(messageSent: $messageText, suggestionTitle: "Suggest some codenames", suggestionContent: "for a project introducing flexible work arrangements")
                            SuggestionView(messageSent: $messageText, suggestionTitle: "Explain why popcorn pops", suggestionContent: "to a kid who loves watching it in the microwave")
                            
                            Spacer()
                            
                        }.onTapGesture {}
                        
                    }
                }
                Spacer()
                
                
                HStack(spacing: 10){
                    
                    TextField("Ask anything", text: $messageText){
                        sendMessage()
                    }
                    .padding(10)
                    .lineLimit(5, reservesSpace: false)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(.brandPrimary, lineWidth: 0.5))
                    
                    
                    
                    Button(action: {
                        sendMessage()
                    }, label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(.brandPrimary)
                    })
                    
                    
                }   .padding()
                    .padding(.bottom, 70)
            }           .edgesIgnoringSafeArea(.top)
            
            
            
                .tint(.brandSecondary)
        
        
            .navigationBarBackButtonHidden()
        //}
            .fullScreenCover(isPresented: $sheetisPresented, content: {
            WelcomePageSearch(sheetIsPresented: $sheetisPresented)
                    .presentationBackgroundInteraction(.enabled)
                    .presentationBackground(.ultraThickMaterial)
                    
            })
    
            .presentationBackgroundInteraction(.enabled)
    }
    func sendMessage(){
        print(messageText)
        chatMessages.append(Message(content: messageText, dateCreated: .now, sender: .me))
        messageText = ""
                
    }
    
        
    
   
}

#Preview {
    ChatView()
}




struct SuggestionView: View {
    @Binding var messageSent: String
    let suggestionTitle: String
    let suggestionContent: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 15){
            HStack {
                Text(suggestionTitle)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.brandPrimary)
                
                Spacer()
                
                Image(systemName: "arrow.up.forward")
            }.padding(.horizontal)
            
            Text(suggestionContent)
                .font(.system(size: 14))
                .padding(.horizontal)
                .foregroundStyle(.brandPrimary.opacity(0.8))
            
        }
        .frame(height: 100)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 36)
                //.stroke(.brandSecondary)
                .foregroundStyle(.ultraThinMaterial))
        .padding(.horizontal)
        .onTapGesture {
            messageSent = "\(suggestionTitle) \(suggestionContent)"
            
            
        }
    }
}
