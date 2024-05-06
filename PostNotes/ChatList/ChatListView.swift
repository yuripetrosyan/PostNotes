//
//  ChatListView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 06/05/2024.
//

import SwiftUI

struct ChatListView: View {
    @StateObject var viewModel = ChatListViewModel()
    
    var body: some View {
        
        Group{
            //3 loading states
            switch viewModel.loadingState {
                //if chats are loading show this text
            case .loading, .none:
                VStack{
                    ProgressView()
                    Text("Loadingn your chats...")
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
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }.onAppear{
            if viewModel.loadingState == .none{
                viewModel.fetchData()
            }
        }
    }
}

#Preview {
    ChatListView()
}
