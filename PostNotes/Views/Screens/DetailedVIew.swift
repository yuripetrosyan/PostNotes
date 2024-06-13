import SwiftUI
import SwiftData
import RiveRuntime

struct DetailedVIew: View {
    @ObservedObject var viewModel: DetailedViewViewModel
    @State private var gptIsActive = false
    @State private var ShowHideMenu: Bool = false
    @State private var iconPosition = false
    
    
    //  @Binding var backgroundAnimationON: Bool
    init(item: Note, updateNote: @escaping (Note) -> Void) {
        self._viewModel = ObservedObject(wrappedValue: DetailedViewViewModel(note: item))
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .foregroundStyle(.thinMaterial).colorScheme(.dark)
                    
                    //  if backgroundAnimationON{
                        .background(RiveViewModel(fileName: "shapes").view()
                            .ignoresSafeArea()
                            //.colorInvert()
                            .blur(radius: 0)
                            .offset(CGSize(width: 0.0, height: -50.0))
                            .scaleEffect(CGSize(width: 4.3, height: 2.0))
                        )
                    //    }
                    
                        .overlay {
                            //MARK: - Note Header
                            HStack {
                                TextField("", text: $viewModel.note.title)
                                    .foregroundStyle(.brandOnly1)
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
                                    .tint(.brandOnly1)
                                    
                                    //                                    Menu {
                                    //                                        Button("Analyze") {
                                    //                                            Task {
                                    //                                                withAnimation(.bouncy){
                                    //                                                    gptIsActive = true
                                    //                                                }
                                    //                                                await viewModel.analyzeNoteContent()
                                    //                                            }
                                    //                                        }
                                    //                                        Button("Summarize") {
                                    //                                            Task {
                                    //                                                withAnimation(.bouncy){
                                    //
                                    //                                                    gptIsActive = true
                                    //                                                }
                                    //                                                await viewModel.summarizeNoteContent()
                                    //                                            }
                                    //                                        }
                                    //                                        Button("Correct") {
                                    //                                            Task {
                                    //                                                withAnimation(.bouncy){
                                    //                                                    gptIsActive = true
                                    //                                                }
                                    //                                                await viewModel.correctNoteContent()
                                    //                                            }
                                    //                                        }
                                    //                                    } label: {
                                    //                                        Image(systemName: "sparkles")
                                    //                                            .foregroundStyle(.yellow)
                                    //                                            .font(.title)
                                    //                                    }
                                }
                            }
                            
                            .padding()
                            .padding(.top, 100)
                        }
                }
                
                //MARK: - Note Content
                ZStack {
                    
                    ZStack{
                        TextEditor(text: $viewModel.note.content)
                            .foregroundStyle(.brandPrimary)
                            .padding()
                        
                        
                        
                        MenuItemsView
                    }
                  
                    
                    
                    VStack {
                        Spacer()
                        
                        if gptIsActive {
                            gptView
                        }
                        
                        
                    }
                }
            }
        }
        .ignoresSafeArea()
        .tint(.white)
    }
    
    
    var MenuItemsView: some View{
        
        ZStack {
            // Color.black.ignoresSafeArea()
            
            // Items
            ZStack {
                
                Circle()
                    .stroke()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .opacity(0)
                
                
                
                Text("Analyze")
                    .font(.headline)
                    .frame(width: 80, height: 30)
                    .offset(x: -85)
                    .foregroundColor(.brandPrimary)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundStyle(.ultraThinMaterial)
                        .frame(width: 110)
                        .padding(.trailing, 140)
                    )
                   
                    .opacity(ShowHideMenu ? 1 : 0)
                   
                    .rotationEffect(.degrees(iconPosition ? 60: -180 ))
                    .animation(.easeInOut(duration: 1).delay(0.1))
                    .onTapGesture {
                        Task {
                            withAnimation(.bouncy){
                                ShowHideMenu.toggle()
                                iconPosition.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                                    gptIsActive = true
                                })
                            }
                            await viewModel.analyzeNoteContent()
                        }
                    }
                
                Text("Summerize")
                    .font(.headline)
                    .frame(width: 200, height: 30)
                    .offset(x: -95)
                    .foregroundColor(.brandPrimary)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundStyle(.ultraThinMaterial) .frame(width: 140)
                        .padding(.trailing, 160))
                    .opacity(ShowHideMenu ? 1 : 0)
                    .rotationEffect(.degrees(iconPosition ? 30: -180 ))
                    .animation(.easeInOut(duration: 1).delay(0.3))
                    .onTapGesture {
                        Task {
                            withAnimation(.bouncy){
                                ShowHideMenu.toggle()
                                iconPosition.toggle()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                                    gptIsActive = true
                                })
                                
                                
                            }
                            await viewModel.summarizeNoteContent()
                        }
                    }
                
                Text("Correct")
                    .font(.headline)
                    .frame(width: 250, height: 30)
                    .offset(x: -85)
                    .foregroundColor(.brandPrimary)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: 110)
                        .padding(.trailing, 140))
               
                    .opacity(ShowHideMenu ? 1 : 0)
                    .rotationEffect(.degrees(iconPosition ? 0: -180 ))
                //.rotationEffect(.degrees(45))
                    .animation(.easeInOut(duration: 1).delay(0.6))
                    .onTapGesture {
                        Task {
                            withAnimation(.bouncy){
                                ShowHideMenu.toggle()
                                iconPosition.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                                    gptIsActive = true
                                })
                            }
                            await viewModel.correctNoteContent()
                        }
                    }
            }
            .clipShape(Rectangle().offset(x: -20, y: -50))
            .offset(x: 150, y: 275)
            
            
            // Add Menu
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Circle()
                        .frame(width: 60, height: 60)
                        .padding(10)
                        .foregroundStyle(ShowHideMenu ? .ultraThinMaterial : .bar)
                        .overlay {
                            Image(systemName: ShowHideMenu ? "sparkle" : "sparkles")
                                .foregroundStyle(.yellow)
                                .font(.title)
                                .fontWeight(.heavy)
                                .rotationEffect(.degrees(ShowHideMenu ? 45 : 0 ))
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)){
                                ShowHideMenu.toggle()
                                iconPosition.toggle()
                            }
                        }
                }
            }
            .padding()
        }
    }
    
    
    
    
    //}
    
    var gptView: some View {
        
        VStack{
            Image(systemName: "chevron.compact.down")
                .font(.headline)
                .onTapGesture {
                    withAnimation(.easeInOut.delay(0.2)){
                        gptIsActive = false
                    }
                }
            Text(viewModel.gptReview)
                .padding()
        }
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


