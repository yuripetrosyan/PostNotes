import SwiftUI
import SwiftData

struct FoldersView: View {
    
    
    @Environment(\.modelContext) var modelContext // Add environment property
    
    var categories: [String]
    
    @ObservedObject var folderManager = FoldersViewModel.shared
    @State private var isShowingFolderPopover = false
    @State private var selectedCategory: String?
    // = "All Notes" // Start with "All Notes" selected
    //@State private var refreshID = UUID()
    
    @Query(sort: \Note.date, order: .reverse) var items: [Note]
    
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 180.0){
                            ForEach(items, id: \.id) { note in
                                NavigationLink(destination: DetailedVIew(item: note) { _ in })  {
                                    GeometryReader { geometry in
                                        CustomGridItemView(item: note)
                                            .rotation3DEffect(Angle(degrees:
                                                                        Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                                    }
                                }
                            }
                        } .padding(.leading, 30)
                            .padding(.top, 10)
                          
                       // .padding()
                        .frame(height: 190)
                    }
                    
                    
                    ZStack {
                        VStack{
                            Section(header: Text("All Notes")){
                                NavigationLink(destination: GridView(), isActive: Binding<Bool>(get: {
                                    selectedCategory == "All Notes"
                                }, set: { _ in })){
                                    CustomFolderCell(name: "All Notes")
                                        .onTapGesture {
                                            selectedCategory = "All Notes"
                                        }
                                }
                            }
                        }
                        .opacity(0)
                        .hidden()
                        
                        
                        List {
                            Section(header: Text("All Notes")) {
                            NavigationLink(tag: "All Notes", selection: $selectedCategory) {
                                GridView()
                            } label: {
                                CustomFolderCell(name: "All Notes")
                            }
                        }

                            Section(header: Text("Notes on the phone")) {
                                ForEach(categories, id: \.self) { category in
                                    NavigationLink(tag: category, selection: $selectedCategory) {
                                        GridView(category: category)
                                    } label: {
                                        CustomFolderCell(name: category)
                                            .swipeActions(allowsFullSwipe: true) {
                                                Button(role: .destructive) {
                                                    deleteFolder(name: category)
                                                } label: {
                                                    Label("Delete", systemImage: "trash")
                                                }
                                            }
                                    }
                                }
                            }
                                                    }}
                    .shadow(radius: 3, x:3, y: 2)
                    .scrollContentBackground(.hidden)
                    .padding(.top)
                    .padding(.bottom, 60)//not to be obscured by tabview
                    .listRowSeparator(.hidden)
                    
                    .listRowSpacing(5)
                    
                    
                }.navigationTitle("Folders").navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing){
                            Image(systemName: "folder.badge.plus")
                                .onTapGesture {
                                    withAnimation(Animation.smooth){
                                        isShowingFolderPopover.toggle()
                                    }
                                }
                            
                        }
                    }
                
            }
             Color(.primary1)
                .ignoresSafeArea()
                .opacity(isShowingFolderPopover ? 0.7 : 0)
            
            if isShowingFolderPopover{
                withAnimation(Animation.smooth){
                    AddFolderPopover(isShowingFolderPopover: $isShowingFolderPopover, onSave: {
                        updateFolders()
                    })
                }
            }
            
            
        }
    }
 }

func updateFolders() {
    //refreshID = UUID() // Force refresh by changing the state
}

func deleteFolder(name: String) {
    FoldersViewModel.shared.removeFolder(name: name)
    //   refreshID = UUID() //Signal a change
}


struct CustomFolderCell: View {
    var name: String
    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 11.0)
                    .frame(width: 64, height: 64)
                
                Image(systemName: "folder")
                    .foregroundStyle(.primary1)
            }
            
            Text(name)
                .frame(width: 250, height: 60, alignment: .leading)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(width: 290)
        .padding(.vertical, -11)
    }
}

#Preview(body: {
    FoldersView(categories: ["Recent Notes", "All Notes", "Starred Notes", "Trash"])
})

//
//
//struct FoldersView_Previews: PreviewProvider {
//    static var previews: some View {
//        let categories = ["Recent Notes", "All Notes", "Starred Notes", "Trash"]
//        return FoldersView(categories: categories)
//    }
//}
