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
                        TextField("Search", text: $searchedText)
                            .padding()
                            .frame(height: 40)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(radius: 5, x: 3, y: 5)
                            .padding(.horizontal)
                            .padding(.top, 10)
                        
                        //Spacer()
                        
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            
                            // Check if items array is empty
                            if items.isEmpty {
                                // Adding the button
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
                        }.foregroundStyle(.brandPrimary)
                        
                        
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
                //hide tool bar for this
               // .toolbarBackground(.hidden, for: .tabBar)
            }
            
            if isShowingPopover{
                    
                    //So that background won't animate
                    CustomNotepadPopoverLonger(isShowingPopover: $isShowingPopover, onSave: { title, content in
                        onAddNewNote(title: title, content: content)
                    })
                    
                    .transition(.offset(x: 70, y: 140))
                    .animation(.bouncy)

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






//struct ContentView_Previews2: PreviewProvider {
//    static var previews: some View {
//        let sampleNotes: [Note] = [
//            Note(title: "Sample Note 1", content: "This is the content of sample note 1. It is extra good as the whole experience is giving me "),
//            Note(title: "Sample Note 2", content: "This is the content of sample note 2. To be fully aware of the thing that gives to the whoel "),
//            Note(title: "Sample Note 3", content: "This is the content of sample note 3. Yes")
//        ]
//        return GridView(items: sampleNotes)
//    }
//}
