import SwiftUI

struct TopRoundedRectangle: Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Top left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + radius))
        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
                    radius: radius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)
        
        // Top right corner
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                    radius: radius,
                    startAngle: .degrees(270),
                    endAngle: .degrees(0),
                    clockwise: false)
        
        // Bottom right and left corners
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct CustomNotepad: View {
    var body: some View {
        ZStack{
            
            
            RoundedRectangle(cornerRadius: 25)
               // .strokeBorder(Color.brandPrimary, lineWidth: 1)
               // .shadow(radius: 5)
                .frame(width: 170, height: 170)
                .foregroundStyle(.white)
               // .shadow(radius: 10)
            
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 170, height: 50)
                .offset(CGSize(width: 0.0, height: -60.0))
                .foregroundColor(.brandPrimary)
            
        }
       
        .shadow(radius: 5, x: 3, y: 5)
        .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 25))
                      
                          
        

    }
}




#Preview {
    CustomNotepad()
}
