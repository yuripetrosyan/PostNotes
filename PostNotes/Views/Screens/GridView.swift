//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
import SwiftData

struct GridView: View {
    
    @Environment(\.modelContext) var context
    @Query(sort: \Note.date, order: .reverse) var items: [Note]    
    
    var category: String? // category optional

    @ObservedObject var foldersManager = FoldersViewModel.shared
    @State var isShowingPopover = false
    @State var folderNameFilter: String? = nil
    @State var searchedText: String = ""
    @State private var showingConfirmation = false

    
    
   
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    //MARK: - body
    
    
    var body: some View {
        

        
      //  NavigationStack{
            ZStack{
                
               
               ZStack{
                   
                   ScrollView {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            // Check if items array is empty
                            if items.isEmpty {
                                // Add first note if it's empty
                                firstNoteAdd()
                                    .onTapGesture {
                                        withAnimation(Animation.smooth){
                                            isShowingPopover.toggle()
                                        }
                                    }
                                
                            }else{
                                ForEach(items.filter { category == nil || $0.category == category }, id: \.id) { note in
                                    NavigationLink(destination: DetailedVIew(item: note) { _ in })  {
                                        CustomGridItemView(item: note)
                                            .contextMenu {
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
                                                        context.delete(note)
                                                   
                                                } label: {
                                                    Label("Delete", systemImage: "trash")}
                                            }
                                    }
                                }
                            }
                        }
                        
                        .foregroundStyle(.brandPrimary)
                        .padding()
                        .padding(.top, 55)
                    }
                   
                    VStack{
                        SearchBar(text: $searchedText)
                        Spacer()
                    }
                   
               }.opacity(isShowingPopover ? 0.2 : 1)
                
                //showing add popover
                if isShowingPopover{
                    CustomNotepadPopoverLonger(isShowingPopover: $isShowingPopover)
                        
                }
                
                
                
            }
            .navigationTitle(category ?? "All Notes")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                  ToolbarItem(placement: .topBarTrailing) {
                      Button {
                          withAnimation(Animation.smooth){
                              isShowingPopover.toggle()
                          }
                      } label: {
                          Image(systemName: "plus")
                              .tint(.brandPrimary)
                      }
                  
                    
                    
                }
                
                 

            }
           // .navigationBarBackButtonHidden(true)
      //  }.navigationBarBackButtonHidden()
        
        
    }
    
  }
    


#Preview {
    GridView()
}

//
//#Preview {
//    //GridView()
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Note.self, configurations: config)
//    let note = Note(title: "Friday", content: "No tasks left", date: Date(), category: "")
//    
//    return GridView(category: "Al; Notes")
//        .modelContainer(container)
//
//}


//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: User.self, configurations: config)
//
//    let user = User(name: "Test User")
//    return EditingView(user: user)
//        .modelContainer(container)
//}
//




