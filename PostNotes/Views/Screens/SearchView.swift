//
//  searchView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI

struct  SearchView: View {
    
    @State var chatMessages: [Message] = Message.sampleMessages
    //@State var chatMessages: [ChatMessage] = []
    @State var messageText: String = ""
    @State private var glowIsOn = false
    @State private var animateSearchView = false

    //private let openAIService = OpenAIService()

    
    var body: some View {
        ZStack{
            Image(.backgroundPhoto)
                .resizable()
                .ignoresSafeArea()
            //TriangleLoader().scaleEffect(CGSize(width: 0.5, height: 0.5))
            
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(chatMessages, id: \.id){
                            message in MessageView(message: message)
                                .contextMenu{
                                    Button {
                                        
                                    } label: {
                                        Label("Favorite", systemImage: "heart")
                                    }
                                    Button{
                                        
                                    }  label: {
                                        Label("Edit", systemImage: "pencil")}
                                    Button {
                                        
                                    } label: {
                                        Label("Share", systemImage: "square.and.arrow.up")
                                    }
                                    Divider()
                                    
                                    
                                    Button(role: .destructive) {
                                        
                                        //      Delete note here
                                        // context.delete(note)
                                      //  chatMessages.remove(at: Int(UUID().uuidString) ?? 0)
                                        
                                        
                                        
                                    }
                                label: {
                                    Label("Delete", systemImage: "trash")}
                                }
                        
                            
                        }
                    }.padding(.top, 40)
                }.frame(maxWidth: .infinity, maxHeight: 420)
                
                HStack{
                    TextField("Enter the prompt", text: $messageText){
                        sendMessage()
                    }.padding(10)
                        .background(.ultraThinMaterial.shadow(.inner(color: glowIsOn ? .blue.opacity(0.4) : .gray.opacity(0.3) ,radius: 10)))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .onTapGesture {
                            withAnimation(Animation.smooth){
                                glowIsOn = true
                            }
                        }
                        .onSubmit {
                            withAnimation(Animation.smooth){
                                glowIsOn = false
                            }
                        }
                    Button(action: {
                        withAnimation(Animation.smooth){
                            glowIsOn = false
                        }
                        sendMessage()
                    }, label: {
                        Image(systemName: "paperplane")
                            .resizable()
                            .foregroundStyle(.brandPrimary)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .padding(8)
                            .offset(CGSize(width: -1.5, height: 1.0))
                              .background(.gray.opacity(0.2))
                            .clipShape(Circle())
                    })
                 }.frame(height: 50)
                    .padding()
                
                
            }.background(.ultraThinMaterial.shadow(.inner(color: .gray.opacity(0.8) ,radius: 5)))
                .frame(maxWidth: .infinity, minHeight: 200)
                .cornerRadius(35)
            .padding()
    
            .scaleEffect(x: animateSearchView ? 1 : 0.2 , y: animateSearchView ? 1 : 0.2, anchor: .bottom)
           // .offset(y: animateSearchView ? 0 : 300)
            
            .onAppear{
                withAnimation(Animation.smooth){
                    self.animateSearchView = true
                }
            }
            
        
            
            
        }
        
    }
    
    func sendMessage(){
        print(messageText)
        chatMessages.append(Message(id: UUID().uuidString, content: messageText, dateCreated: .now, sender: .me))
        messageText = ""
        
    }
}

#Preview {
    SearchView()
}
