//
//  ChatListView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 06/05/2024.
//

import SwiftUI

struct ChatListView: View {
    @StateObject var viewModel = ChatListViewModel()
    @EnvironmentObject var appState: AppState
    var body: some View {
        Group{
            //3 loading states
            switch viewModel.loadingState {
                //if chats are loading show this text
            case .loading, .none:
                VStack{
                    ProgressView()
                    Text("Loading your chats...")
                        .padding(.top, 20)
                }
                //case with no chats
            case .noResults:
                Text("No chats found")
                //when chats are found we show them as a list
            case .resultsFound:
                List{
                    ForEach(viewModel.chats) { chat in
                        NavigationLink(value: chat.id){
                            VStack(alignment: .leading){
                                HStack{
                                    
                                    ZStack(alignment: .center){
                                        RoundedRectangle(cornerRadius: 11)
                                            .foregroundStyle(.brandPrimary)
                                            .frame(width: 62,height: 62)
                                           
                                          Image(systemName: "book.pages").symbolEffect(.pulse, options: .repeating, isActive: true)
                                            .foregroundStyle(.primary1)
                                        
                                        
                                    }
                                    .padding(.leading, -20)
                                    .shadow(radius: 5, x: 2, y: 2)

                                    
                                    
                                VStack(alignment: .leading){
                                    Text(chat.topic ?? "New Chat")
                                        .font(.headline)
                                        .foregroundStyle(.brandPrimary)
                                        .padding(.bottom, 5)
                                    
                                    
                                    Text(chat.lastMessageTimeAgo)
                                        .font(.caption2)
                                        .foregroundStyle(.brandPrimary.opacity(0.8))
                                }
                                .padding(5)
                                
                                    
                                    
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
        .navigationTitle("Chats").navigationBarTitleDisplayMode(.inline)
        
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.showProfile()
                } label: {
                    Image(systemName: "person")
                }
                
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        do{
                            let chatId = try await viewModel.createChat(user: appState.currentUser?.uid)
                            appState.navigationPath.append(chatId)
                        }
                        catch{
                            print(error)
                        }
                    }
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }).tint(.brandPrimary)
        .sheet(isPresented: $viewModel.isShowingProfileView, content: {
            ProfileView()
        })
        .navigationDestination(for: String.self, destination: { chatId in
            ChatView(viewModel: .init(chatId: chatId))
        })
        .onAppear{
            if viewModel.loadingState == .none{
                viewModel.fetchData(user: appState.currentUser?.uid)
                
                
            }
        }
        
    }
}
//
//#Preview {
//    ChatListView()
//}
