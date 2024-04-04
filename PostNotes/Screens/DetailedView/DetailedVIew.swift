import SwiftUI


struct DetailedVIew: View {
    
    let item: Note
    @Binding var items: [Note]
    @State private var editedTitle: String
    @State private var editedContent: String

    init(item: Note, items: Binding<[Note]>) {
         self.item = item
         self._items = items
         _editedTitle = State(initialValue: item.title)
         _editedContent = State(initialValue: item.content)
        
     }
    
    var body: some View{
      NavigationStack  {
            VStack{
            VStack{
                Rectangle().frame(maxWidth: .infinity, maxHeight: 200)
                    .overlay {
                        HStack{
                          //  TextEditor(text: $editedTitle)
                            TextField("", text: $editedTitle)
                                .foregroundStyle(.white)
                                .fontDesign(.serif)
                                .font(.title)
                                .onChange(of: editedTitle) { oldValue, newValue in
                                  // Update the content of the note when edited
                                  if let index = items.firstIndex(where: { $0.id == item.id }) {
                                    items[index].title = newValue
                                  }
                                }

                               
                            
                            Spacer()
                            VStack{
                                Custom3circles()
                                    .frame(width: 80, height: 800)
                                
                                Spacer()
                            }
                            
                        }
                            .padding()
                            .padding(.top, 100)
                    }
                
            }
                
                
                TextEditor(text:  $editedContent)
                    .foregroundStyle(.brandPrimary)
                    .padding()
                    .onChange(of: editedContent) { oldValue, newValue in
                      // Update the content of the note when edited
                      if let index = items.firstIndex(where: { $0.id == item.id }) {
                        items[index].content = newValue
                      }
                    }
                   


            
//            Text(item.itemContent)
//                .padding()
            
            Spacer()
            }.ignoresSafeArea()
             
              
        
      } .tint(.white)
        .onDisappear {
                NoteManager.shared.saveNotes(self.items)
            }
          
        
    }
    
}

//
//#Preview {
//    DetailedVIew(item: MockData.sampleNote)
//}



