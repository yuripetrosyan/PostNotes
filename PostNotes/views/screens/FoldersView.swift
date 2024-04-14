import SwiftUI
import SwiftData

struct FoldersView: View {
    
    var categories: [String]
    @Binding var selectedCategory: String? // Binding for selected category
    @State private var isShowingFolderPopover = false
    
    @Query(sort: \Note.date, order: .reverse) var items: [Note]
    var category: String? // category optional
    
    
    
    init(categories: [String], selectedCategory: Binding<String?> = .constant(nil)) {
        self.categories = categories
        self._selectedCategory = selectedCategory
    }
    
    var body: some View {
       NavigationView {
                ZStack {
                    VStack {
                        
                        
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                
                                
                                ForEach(items, id: \.id) { note in
                                    NavigationLink(destination: DetailedVIew(item: note) { _ in })  {
                                        CustomGridItemView(item: note)
                                    }
                                }
                            }
                            .padding()
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
                                
                                
                                
                                Section(header: Text("Notes on the phone")) {
                                    ForEach(categories, id: \.self) { category in
                                        NavigationLink(destination: GridView(category: category)) {
                                            CustomFolderCell(name: category)
                                                .swipeActions(allowsFullSwipe: true) {
                                                    HStack {
                                                        Button {
                                                            // Archive action
                                                        } label: {
                                                            Label("Archive", systemImage: "archivebox")
                                                        }
                                                        .tint(.blue)
                                                        
                                                        Button {
                                                            // Delete action
                                                            
                                                            
                                                        } label: {
                                                            Label("Delete", systemImage: "trash")
                                                            
                                                        }
                                                        .tint(.red)
                                                    }
                                                }
                                        }
                                    }
                                }
                                
                                
                            }
                            .shadow(radius: 3, x: 2, y: 3)
                             .scrollContentBackground(.hidden)
                            .padding(.top)
                            .listRowSeparator(.hidden)
                            .listRowSpacing(10)
                        }
                        
                    }

                    
                 
                 
                 .navigationTitle("Folders").navigationBarTitleDisplayMode(.inline)
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
                    if isShowingFolderPopover{
                        AddFolderPopover(isShowingFolderPopover: $isShowingFolderPopover)
                    }
            }
        }//.navigationBarBackButtonHidden()
        
    }
}

struct CustomFolderCell: View {
    var name: String

    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(width: 63, height: 63)
                
                Image(systemName: "folder")
                    .foregroundStyle(.primary1)
            }
            // .padding(-15)
            // .padding(.leading, -10)
            
            Text(name)
            // .padding(.horizontal, 20)
                .frame(width: 250, height: 60, alignment: .leading)
                .padding(.leading, 5)
            // .padding(.trailing, -30)
            Spacer()
        }
        //  .background(.red)
        .frame(width: 310 ,height: 40)
        .shadow(radius: 5, x: 3, y: 5)
    }
}

struct FoldersView_Previews: PreviewProvider {
    static var previews: some View {
        let categories = ["Recent Notes", "All Notes", "Starred Notes", "Trash"]
        return FoldersView(categories: categories)
    }
}
