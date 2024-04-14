import SwiftUI

struct DetailedVIew: View {
    
    let item: Note
    @State private var editedTitle: String
    @State private var editedContent: String
    var updateNote: (Note) -> Void // Closure to update the note
    @State private var selectedCategory = ""

    
    init(item: Note, updateNote: @escaping (Note) -> Void) {
        self.item = item
        self._editedTitle = State(initialValue: item.title)
        self._editedContent = State(initialValue: item.content)
        self.updateNote = updateNote
    }
    
    var body: some View {
            VStack {
                VStack {
                    Rectangle().frame(maxWidth: .infinity, maxHeight: 200)
                        .overlay {
                            HStack {
                                TextField("", text: $editedTitle)
                                    .foregroundStyle(.white)
                                    .fontDesign(.serif)
                                    .font(.title)
                                    .onChange(of: editedTitle) { newValue in
                                        // Update the content of the note when edited
                                        var updatedItem = item
                                        updatedItem.title = newValue
                                        updateNote(updatedItem)
                                    }
                                
                                Spacer()
                                VStack {
//                                    Custom3circles()
//                                        .frame(width: 80, height: 800)
//                                   
                                    Text(selectedCategory)
                                    
//                                    Picker("Select the category", selection: $selectedCategory) {
//                                        ForEach(FoldersManager.shared.folders, id: \.self) { folder in
//                                            Text(folder)
//                                        }
//                                    }
//                                    .pickerStyle(.menu)
//                                    .tint(.brandSecondary)
                                }
                            }
                            .padding()
                            .padding(.top, 100)
                        }
                }
                
                TextEditor(text: $editedContent)
                    .foregroundStyle(.brandPrimary)
                    .padding()
                    .onChange(of: editedContent) { newValue in
                        // Update the content of the note when edited
                        var updatedItem = item
                        updatedItem.content = newValue
                        updateNote(updatedItem)
                    }
                
                Spacer()
            }
            .ignoresSafeArea()
        
        .tint(.white)
    }
}


struct DetailedVIew_Previews: PreviewProvider {
    static var previews: some View {
        let sampleNote = Note(title: "Sample Title", content: "Sample Content", date: .now, category: "Favourite")
        return DetailedVIew(item: sampleNote) { _ in }
    }
}

