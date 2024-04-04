//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI

struct GridView: View {
    
    @State var isShowingLongPress = false
    @State var isShowingPopover = false
    @State var selectedNote: Note? = nil
    @State var searchedText: String = ""
    @State private var items: [Note] = [ ]

    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    // Load notes when the view appears
    init() {
        self._items = State(initialValue: NoteManager.shared.loadNotes())
        
    }
    
    //MARK: - body
    
    
    
    var body: some View {
        ZStack{
            NavigationStack{
                ZStack{
                    ScrollView {
                        TextField("Search", text: $searchedText)
                            .padding()
                            .frame(height: 40)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(radius: 5, x: 3, y: 5)
                            .padding(.horizontal)
                            .padding(.top, 10)
                        
                        //Spacer()
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(items) { note in
                                NavigationLink(destination: DetailedVIew(item: note, items: $items))  {
                                    CustomGridItemView(item: note)
                                        .contextMenu {
                                            Button {
                                                
                                            } label: {
                                                Label("Add to Favorites", systemImage: "star")
                                            }
                                            Button{
                                                
                                            }  label: {
                                                Label("Edit", systemImage: "pencil")
                                            }
                                           
                                            
                                            Button(action: {
                                                NoteManager.shared.deleteNote(note, from: &items)
                                            }) {
                                                Label("Delete", systemImage: "trash")
                                            }
                                        }

                                }
                            }
                        }
                        
                        .padding()
                    }
                    //Round button here
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button(action: {isShowingPopover.toggle()}, label: {RoundButton(imageName: "pencil")})
                            
                                .padding()
                        }
                        .padding()
                    }
                }
                .navigationTitle("My Notes").navigationBarTitleDisplayMode(.inline)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                                .imageScale(.large)
                                .tint(.brandPrimary)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: foldersView()){
                            Image(systemName: "folder")
                                .tint(.brandPrimary)
                        }
                    }
                }
            }
            
            if isShowingPopover{
                
                CustomNotepadPopover(popoverName: "Note Title", popoverDescription: "Write the title of your note", isShowingPopover: $isShowingPopover){ newTitle in
                    items.append(Note(title: newTitle, content: ""))
                    
                    NoteManager.shared.saveNotes(items) // Save notes here
                    
                }
                
               
                .transition(.move(edge: .bottom))
                .animation(.smooth)
                .background(.ultraThinMaterial)
                
            }
            
        }.onDisappear {
            // Save notes when the view disappears
            NoteManager.shared.saveNotes(self.items)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}

