//
//  RoundButton.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 25/03/2024.
//

import SwiftUI

struct RoundButton: View {
    
    let imageName: String
    
    @State private var shadowOn = false
    var body: some View {
        
        
    
            
            
            
            Circle()
                .foregroundStyle(.ultraThinMaterial)
                .frame(width: 60)
                .clipShape(Circle())
                .shadow(radius: shadowOn ? 9 : 7, x: shadowOn ? 2 : 5, y:shadowOn ? 3 : 6)
        
                .overlay{
                    
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.brandPrimary)
                    
                }.onTapGesture {
                    withAnimation(.smooth){
                        shadowOn.toggle()
                    }
                }
            
     
    }
}


#Preview {
    RoundButton(imageName: "folder")
}
