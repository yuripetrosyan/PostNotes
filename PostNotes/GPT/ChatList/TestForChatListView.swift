//
//  TestForChatListView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 14/05/2024.
//

import SwiftUI

struct TestForChatListView: View {
    @StateObject var viewModel = ChatListViewModel()

    
    var body: some View {
        List{
            ForEach(viewModel.mockChats) { chat in
                NavigationLink(value: chat.id){
                    VStack(alignment: .leading){
                        HStack{
                            
                            ZStack(alignment: .leading){
                                
                                RoundedRectangle(cornerRadius: 11)
                                    .foregroundStyle(.brandPrimary)
                                    .frame(height: 62)
                                    .frame(maxWidth: 100)
                                    

                                    
                                VStack(alignment: .leading){
                                    Text(chat.topic ?? "New Chat")
                                        .font(.headline)
                                        .foregroundStyle(.primary1)
                                        .padding(.bottom, 5)
                                    
                                    
                                    Text(chat.lastMessageTimeAgo)
                                        .font(.caption2)
                                        .foregroundStyle(.brandSecondary)
                                }
                                
                                .padding(10)
                            }
                            .padding(.leading, -20)
                            .shadow(radius: 5, x: 2, y: 2)

                            
                        
                            
                            
                            Spacer()
                            Text(chat.model?.rawValue ?? "")
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .foregroundStyle(chat.model?.tintColor ?? .white)
                                .padding(6)
                                .background((chat.model?.tintColor ?? .white).opacity(0.1))
                                .clipShape(Capsule(style: .continuous))
                        }.frame(height: 40)
                        
                    }
                    
                }
                .swipeActions {
                    Button(role: .destructive) {
                        viewModel.deleteChate(chat: chat)
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }

                }
            }
        }
        .shadow(radius: 5, x: 2, y: 2)
        .scrollContentBackground(.hidden)
        .padding(.top)
        .listRowSeparator(.hidden)
        .listRowSpacing(10)
    }
}

#Preview {
    TestForChatListView()
}
