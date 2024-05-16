import SwiftUI


struct CustomNotepadWide: View {
    @State private var initialState: Bool = true
    
    
    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 270, height: initialState ? 110 : 230)
                //Animation
                //Rectangle goes down while top round rectangle goes up
                
                    .offset(CGSize(width: 0.0, height: initialState ? -15.0 : 0))
                
                
                    .foregroundStyle(.ultraThinMaterial.shadow(.inner(radius: 4)))
                
                TopRoundedRectangle(radius: 25)
                    .frame(width: 270, height: 80)
                    .offset(CGSize(width: 0.0, height: -75.0))
                    .foregroundColor(.brandPrimary)
                    .shadow(radius: 5, x: 3, y: 5)
            }
            
            .onAppear{
                withAnimation(.smooth){
                    initialState.toggle()
                }
            }
//            .onTapGesture {
//                withAnimation(.smooth) {
//                    initialState.toggle()
//                }
               
           // }
        
    
    }
    
    
}


struct CustomNotepadWideLonger: View {
    @State private var initialState: Bool = true

    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 270, height: initialState ? 200 : 400)

              //.foregroundStyle(.primary1)//.opacity(0.7)
                .foregroundStyle(.ultraThinMaterial.shadow(.inner(radius: 3)))
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 270, height: 80)
                .offset(CGSize(width: 0.0, height: initialState ? -60 : -160.0))

                .foregroundColor(.brandPrimary)
                
        }

        
        //.shadow(radius: 5, x: 3, y: 5)
        .onAppear{
            withAnimation(.smooth){
                initialState.toggle()
            }
        }
    
       
//        .onTapGesture {
//            withAnimation(.smooth){
//                initialState.toggle()
//            }
//        }
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
                            FoldersViewModel.shared.addFolder(name: folderName)
                            
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
    CustomNotepadWide()
//    AddFolderPopover(isShowingFolderPopover: .constant(true), onSave: )
   
}

#Preview(body: {
    CustomNotepadWideLonger()
})
