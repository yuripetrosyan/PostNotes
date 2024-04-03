import SwiftUI


struct DetailedVIew: View {
    
    let item: Note

    
    var body: some View{
      NavigationStack  {
            VStack{
            VStack{
                Rectangle().frame(maxWidth: .infinity, maxHeight: 200)
                    .overlay {
                        HStack{
                            Text(item.title)
                                .foregroundStyle(.white)
                                .fontDesign(.serif)
                                .font(.title)
                            
                            
                            Spacer()
                            VStack{
                                Custom3circles()
                                    .frame(width: 80, height: 800)
                                
                                Spacer()
                            }
                            
                        }   .padding()
                            .padding(.top, 100)
                    }
                
            }
                
                
                TextEditor(text: .constant("\(item.content)"))
                    .foregroundStyle(.brandPrimary)
                    .padding()
            
//            Text(item.itemContent)
//                .padding()
            
            Spacer()
            }.ignoresSafeArea()
             
              
        
      } .tint(.white)
        
        
    }
    
}

//
//#Preview {
//    DetailedVIew(i)
//}



