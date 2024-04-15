import SwiftUI


struct CustomNotepadWide: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 270, height: 230)
                .foregroundStyle(.ultraThinMaterial.shadow(.inner(radius: 4)))
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 270, height: 80)
                .offset(CGSize(width: 0.0, height: -75.0))
                .foregroundColor(.brandPrimary)
                .shadow(radius: 5, x: 3, y: 5)
            }
    }
}


struct CustomNotepadWideLonger: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 270, height: 400)
              //.foregroundStyle(.primary1)//.opacity(0.7)
                .foregroundStyle(.ultraThinMaterial.shadow(.inner(radius: 3)))
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 270, height: 80)
                .offset(CGSize(width: 0.0, height: -160.0))
                .foregroundColor(.brandPrimary)
                
        }//.shadow(radius: 5, x: 3, y: 5)
    }
}


struct AddFolderPopover: View {
    
    @State private var folderName = ""
    @Binding var isShowingFolderPopover: Bool
    var onSave: () -> Void
    
    var body: some View {
        ZStack{
            
            CustomNotepadWide()
            
            VStack{
                VStack{
                    HStack(alignment: .center){
                        Button("Cancel") {
                            print("Cancel")
                            isShowingFolderPopover = false
                        }
                        
                        Spacer()
                        
                        Button("Save") {
                            print("Save")
                            FoldersManager.shared.addFolder(name: folderName)
                            
                            isShowingFolderPopover = false
                            
                            onSave()

                        }.fontWeight(.semibold)
                    }
                    .foregroundStyle(.brandSecondary)
                    .padding(.horizontal)
                    
                    Text("New Folder")
                        .foregroundStyle(.primary1)
                        .font(.headline)
                        
                }.frame(width: 270, height: 80)
                
                TextField("Name your folder", text: $folderName, axis: .vertical)
                    .padding(10)
                    .lineLimit(5, reservesSpace: false)
                    
                
              
                Spacer()
            }
            
            
        }.frame(width: 270, height: 230)
    }
}




#Preview {
   // CustomNotepadWide()
    //AddFolderPopover(isShowingFolderPopover: .constant(true))
    CustomNotepadWideLonger()
}
