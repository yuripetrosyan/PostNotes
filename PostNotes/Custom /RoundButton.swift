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
        Button{print("new note added ")}
    label:{
        ZStack{
            
            
            
            Circle()
                .foregroundStyle(.ultraThinMaterial)
                .frame(width: 50)
                .clipShape(Circle())
            
            Image(systemName: imageName)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(.brandPrimary)
          
                
            
        }
    }
    }
}

#Preview {
    RoundButton(imageName: "pencil")
}
