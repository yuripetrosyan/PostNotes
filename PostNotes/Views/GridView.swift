//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
import SwiftData

struct GridView: View {
    

    @Query(sort: \Note.date) var items: [Note]
    @State var isShowingPopover = false
    @State var selectedNote: Note? = nil
    @State var searchedText: String = ""
 //   @State private var filteredNotes: [Note] = []
    
    // var items: [Note] = []
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    
    //MARK: - body
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                        
                        // Check if items array is empty
                        if items.isEmpty {
                            // Add first note if it's empty
                            firstNoteAdd()
                                .onTapGesture {
                                    
                                    isShowingPopover.toggle()
                                }
                            
                        }else{
                            ForEach(items, id: \.id) { note in
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
                                                //Delete note here
                                                
                                                
                                                
                                                // NoteManager.shared.deleteNote(note, from: &items)
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
            }
            .navigationTitle("My Notes").navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShowingPopover, content: {
                CustomNotepadPopoverLonger()
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: foldersView()){
                        Image(systemName: "folder")
                            .tint(.brandPrimary)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus")
                        .tint(.brandPrimary)
                        .onTapGesture {
                            withAnimation(Animation.smooth){
                                isShowingPopover.toggle()
                            }
                        }
                    
                }
                
                
            }
            
        }
       
        
    }
    
    
    }

#Preview {
    GridView()
}







