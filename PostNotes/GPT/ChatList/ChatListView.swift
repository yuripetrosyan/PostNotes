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
                                    Text(chat.topic ?? "New Chat")
                                        .font(.headline)
                                    Spacer()
                                    Text(chat.model?.rawValue ?? "")
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(chat.model?.tintColor ?? .white)
                                        .padding(6)
                                        .background((chat.model?.tintColor ?? .white).opacity(0.1))
                                        .clipShape(Capsule(style: .continuous))
                                }
                                Text(chat.lastMessageTimeAgo)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                
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
                }// .scrollContentBackground(.hidden)
                // .listRowSeparator(.hidden)
                .listRowSpacing(5)
            }
            
        }
        .navigationTitle("Chats")
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
        })
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

#Preview {
    ChatListView()
}




