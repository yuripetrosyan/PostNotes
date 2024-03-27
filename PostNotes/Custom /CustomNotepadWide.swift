import SwiftUI


struct CustomNotepadWide: View {
    
    
    var body: some View {
        ZStack{
            TopRoundedRectangle(radius: 25)
                .frame(width: 270, height: 80)
                .offset(CGSize(width: 0.0, height: -75.0))
                .foregroundColor(.brandPrimary)
            
            RoundedRectangle(cornerRadius: 25.0)
                .strokeBorder(Color.brandPrimary, lineWidth: 1)
                .shadow(radius: 5)
                .frame(width: 270, height: 230)
                .shadow(radius: 10)
        }
    }
}


#Preview {
    CustomNotepadWide()
}
