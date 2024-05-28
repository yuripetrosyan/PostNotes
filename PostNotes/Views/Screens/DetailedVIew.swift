import SwiftUI
import SwiftData

struct DetailedVIew: View {
    
    @ObservedObject var viewModel: DetailedViewViewModel // Use the view model
    
    init(item: Note, updateNote: @escaping (Note) -> Void) {
        self._viewModel = ObservedObject(wrappedValue: DetailedViewViewModel(note: item))
    }
    
    var body: some View {
        VStack {
            VStack {
                Rectangle().frame(maxWidth: .infinity, maxHeight: 200)
                    .overlay {
                        HStack {
                            TextField("", text: $viewModel.note.title) // Bind to viewModel.note
                                .foregroundStyle(.primary1)
                                .fontDesign(.serif)
                                .font(.title)
                            
                            Spacer()
                            
                            VStack {
                                //                                Button("Save") {
                                //                                    viewModel.updateNote() // Call updateNote on the view model
                                //                                }.foregroundStyle(.brandSecondary)
                                
                                Picker("Select the category", selection: $viewModel.note.category) {
                                    ForEach(FoldersViewModel.shared.folders, id: \.self) { folder in
                                        Text(folder)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(.brandSecondary)
                                
                            }
                        }
                        .padding()
                        .padding(.top, 100)
                    }
            }
            TextEditor(text: $viewModel.note.content) // Bind to viewModel.note
                .foregroundStyle(.brandPrimary)
                .padding()
            Spacer()
            
            
        }
        .ignoresSafeArea()
        .tint(.white)
    } // Removed .onDisappear as saving is handled in viewModel
}

struct DetailedVIew_Previews: PreviewProvider {
    static var previews: some View {
        let previewModelContext = try! ModelContainer(for: Note.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)).mainContext
        let sampleNote = Note() // Create note with default values
        sampleNote.title = "Sample Title"
        sampleNote.content = "Sample Content"
        sampleNote.date = Date()
        sampleNote.category = "Favourite"
        return DetailedVIew(item: sampleNote) { _ in }
            .environment(\.modelContext, previewModelContext)
    }
}

