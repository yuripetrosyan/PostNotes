import SwiftUI


struct CustomNotepadWide: View {
    
    
    
    var body: some View {
        
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 270, height: 230)
                .foregroundStyle(.white).opacity(0.7)
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 270, height: 80)
                .offset(CGSize(width: 0.0, height: -75.0))
                .foregroundColor(.brandPrimary)
            

                
        }.shadow(radius: 5, x: 3, y: 5)
    }
}




struct CustomNotepadWideLonger: View {
   
    var body: some View {
        
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 270, height: 400)
                .foregroundStyle(.white)//.opacity(0.7)
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 270, height: 80)
                .offset(CGSize(width: 0.0, height: -160.0))
                .foregroundColor(.brandPrimary)
            

                
        }.shadow(radius: 5, x: 3, y: 5)
    }
}


#Preview {
    CustomNotepadWide()
}

#Preview {
    CustomNotepadWideLonger()
}
