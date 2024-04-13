import SwiftUI

struct FoldersView: View {
    //var folders = ["Recent Notes", "All Notes", "Starred Notes", "Trash"]
    var categories: [String]
    //@State private var selectedCategory: String?
    @State var isShowingPopover = false
    @State var newFolderName: String = ""

    init(categories: [String]) {
           self.categories = categories
           
       }
    
    var body: some View {
        NavigationView {
            VStack {
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
                    .listRowSeparator(.hidden)
                    .listRowSpacing(6)
                }
            }
            //.navigationTitle("Folders")
        }.navigationBarBackButtonHidden()
    }
}

struct CustomFolderCell: View {
    var name: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(maxHeight: .infinity)
                    .frame(width: 75)
                
                Image(systemName: "folder")
                    .foregroundStyle(.white)
            }
            .padding(-15)
            .padding(.leading, -10)
            
            Text(name)
                .padding(.horizontal, 20)
            
            Spacer()
        }
        .frame(height: 40)
        .shadow(radius: 5, x: 3, y: 5)
    }
}

struct FoldersView_Previews: PreviewProvider {
    static var previews: some View {
        let categories = ["Recent Notes", "All Notes", "Starred Notes", "Trash"]
        return FoldersView(categories: categories)
    }
}
