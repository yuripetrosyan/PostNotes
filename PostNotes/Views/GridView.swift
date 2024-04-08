//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI

struct GridView: View {
    
    @State var isShowingPopover = false
    @State var selectedNote: Note? = nil
    @State var searchedText: String = ""
    @State private var items: [Note]
 
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    // Load notes when the view appears
    init() {
        self._items = State(initialValue: NoteManager.shared.loadNotes())

    }
    
    //Test
    // Load notes when the view appears
    init(items: [Note]) {
        self._items = State(initialValue: items)
    }
    
    
    //MARK: - body
    
    
    var body: some View {
        ZStack{
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
                                ForEach(items) { note in
                                    NavigationLink(destination: DetailedVIew(item: note, items: $items))  {
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
                                                    NoteManager.shared.deleteNote(note, from: &items)
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
                //hide tool bar for this
               // .toolbarBackground(.hidden, for: .tabBar)
            }
            
            if isShowingPopover{
                    
                    //So that background won't animate
                    CustomNotepadPopoverLonger(isShowingPopover: $isShowingPopover, onSave: { title, content in
                        onAddNewNote(title: title, content: content)
                        //test
                        
                        NoteManager.shared.saveNotes(self.items)

                    })
                    
                    .transition(.offset(x: 0, y: -140))
                    .animation(.smooth)
                    .background(.ultraThinMaterial)
                
    
            }
            
        }
        
        .onDisappear {
            // Save notes when the view disappears
            NoteManager.shared.saveNotes(self.items)
        }
    }
    func onAddNewNote(title: String, content: String) {
        items.append(Note(title: title, content: content))
    }
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}






struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        let sampleNotes: [Note] = [
            Note(title: "Sample Note 1", content: "This is the content of sample note 1. It is extra good as the whole experience is giving me "),
            Note(title: "", content: "This is the content of sample note 2. To be fully aware of the thing that gives to the whoel "),
            Note(title: "Sample Note 3", content: "This is the content of sample note 3. Yes")
        ]
        return GridView(items: sampleNotes)
    }
}
