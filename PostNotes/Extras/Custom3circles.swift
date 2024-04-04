//
//  Custom3circles.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 25/03/2024.
//

import SwiftUI

struct Custom3circles: View {
    var body: some View {
        
        HStack{
            Circle()
            Circle()
            Circle()
            
        }
        .foregroundStyle(.white)
            .frame(height: 30)
            
    }
}

#Preview {
    Custom3circles()
}
