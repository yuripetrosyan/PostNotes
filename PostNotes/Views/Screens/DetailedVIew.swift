import SwiftUI
import SwiftData

struct DetailedVIew: View {
    @ObservedObject var viewModel: DetailedViewViewModel
    @State private var gptIsActive = false
    
    init(item: Note, updateNote: @escaping (Note) -> Void) {
        self._viewModel = ObservedObject(wrappedValue: DetailedViewViewModel(note: item))
    }
    
    var body: some View {
        VStack {
            VStack {
                Rectangle().frame(maxWidth: .infinity, maxHeight: 200)
                    .overlay {
                        //MARK: - Note Header
                        HStack {
                            TextField("", text: $viewModel.note.title)
                                .foregroundStyle(.primary1)
                                .fontDesign(.serif)
                                .font(.title)
                            
                            Spacer()
                            
                            HStack {
                                Picker("Select the category", selection: $viewModel.note.category) {
                                    ForEach(FoldersViewModel.shared.folders, id: \.self) { folder in
                                        Text(folder)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(.brandSecondary)
                                
                                Menu {
                                    Button("Analyze") {
                                        Task {
                                            withAnimation(.bouncy){
                                                gptIsActive = true
                                            }
                                            await viewModel.analyzeNoteContent()
                                        }
                                    }
                                    Button("Summarize") {
                                        Task {
                                            withAnimation(.bouncy){
                                                
                                                gptIsActive = true
                                            }
                                            await viewModel.summarizeNoteContent()
                                        }
                                    }
                                    Button("Correct") {
                                        Task {
                                            withAnimation(.bouncy){
                                                gptIsActive = true
                                            }
                                            await viewModel.correctNoteContent()
                                        }
                                    }
                                } label: {
                                    Image(systemName: "sparkles")
                                        .foregroundStyle(.yellow)
                                        .font(.title)
                                }
                            }
                        }
                        .padding()
                        .padding(.top, 100)
                    }
            }
            
            //MARK: - Note Content
            ZStack {
                TextEditor(text: $viewModel.note.content)
                    .foregroundStyle(.brandPrimary)
                    .padding()
                
                VStack {
                    Spacer()
                    
                    if gptIsActive {
                        gptView
                    }
                }
            }
        }
        .ignoresSafeArea()
        .tint(.white)
    }
    
    var gptView: some View {
        Text(viewModel.gptReview)
            .padding()
            .padding(.vertical)
            .background(RoundedRectangle(cornerRadius: 30).foregroundStyle(.ultraThinMaterial.shadow(.inner(radius: 3))))
            .frame(minHeight: 60)
            .padding()
            .padding(.bottom)
            .transition(.move(edge: .bottom))
    }
}

struct DetailedVIew_Previews: PreviewProvider {
    static var previews: some View {
        let previewModelContext = try! ModelContainer(for: Note.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)).mainContext
        let sampleNote = Note() // Create note with default values
        sampleNote.title = "Sample Title"
        sampleNote.content = "This is a sample response GPT will give once analyzing the text. It gives the review of the text and can summarize the text, correct the mistakes, and much more in the future."
        sampleNote.date = Date()
        sampleNote.category = "Favourite"
        return DetailedVIew(item: sampleNote) { _ in }
            .environment(\.modelContext, previewModelContext)
    }
}
