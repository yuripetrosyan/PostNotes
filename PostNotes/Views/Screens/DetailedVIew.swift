import SwiftUI

struct DetailedVIew: View {
    
    let item: Note
    var updateNote: (Note) -> Void // Closure to update the note
    @State private var selectedCategory = ""
    
    //Temporary state for title and contenet
    @State private var tempTitle: String
    @State private var tempContent: String

    init(item: Note, updateNote: @escaping (Note) -> Void) {
        self.item = item
        self.updateNote = updateNote
        
        _tempTitle = State(initialValue: item.title)
        _tempContent = State(initialValue: item.content)
    }
    
    var body: some View {
            VStack {
                VStack {
                    Rectangle().frame(maxWidth: .infinity, maxHeight: 200)
                        .overlay {
                            HStack {
                                TextField("", text: $tempTitle)
                                    .foregroundStyle(.primary1)
                                    .fontDesign(.serif)
                                    .font(.title)
                                
                                
                                Spacer()
                                
                                VStack {
                                 
                                    Button("Save") {
                                        let updatedNote = item
                                                  updatedNote.title = tempTitle
                                                  updatedNote.content = tempContent
                                                  updateNote(updatedNote)
                                    }.foregroundStyle(.brandSecondary)
                                    
                                    Text(selectedCategory)
                                 }
                            }
                            .padding()
                            .padding(.top, 100)
                        }
                }
                
                TextEditor(text: $tempContent)
                    .foregroundStyle(.brandPrimary)
                    .padding()
                  
                
                
                Spacer()
            }
            .ignoresSafeArea()
            .tint(.white)
            .onDisappear {
                // Save changes when the view disappears
                let updatedNote = item
                updatedNote.title = tempTitle
                updatedNote.content = tempContent
                updateNote(updatedNote)
            }
    }
}


struct DetailedVIew_Previews: PreviewProvider {
    static var previews: some View {
        let sampleNote = Note(title: "Sample Title", content: "Sample Content", date: .now, category: "Favourite")
        return DetailedVIew(item: sampleNote) { _ in }
    }
}


//#Preview {
//    DetailedVIew(item: .init(title: "Hi there", content: "This is the contnet", date: .now, category: "All"), updateNote: <#(Note) -> Void#>)
//}
