//
//  RoundButton.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 25/03/2024.
//

import SwiftUI

struct RoundButton: View {
    
    let imageName: String
    
    
    var body: some View {
        
        
    //    ZStack{
            
            
            
            Circle()
                .foregroundStyle(.ultraThinMaterial)
                .frame(width: 60)
                
                .clipShape(Circle())
                .shadow(radius: 3, x: 2, y: 3)
                .overlay{
                    
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.brandPrimary)
                    
                }
            
     //   }
    }
}


#Preview {
    RoundButton(imageName: "folder")
}
