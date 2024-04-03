//
//  LongPressedView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 03/04/2024.
//

import SwiftUI


struct LongPressedViewItem: View {
    
    let item: Note

    var body: some View {
        
        LongPressedView()
        
    }
}



struct LongPressedView: View {
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 330, height: 250)
                .foregroundStyle(.white).opacity(0.7)
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 330, height: 80)
                .offset(CGSize(width: 0.0, height: -90))
                .foregroundColor(.brandPrimary)
            

                
        }.shadow(radius: 5, x: 3, y: 5)
    }
}





#Preview {
    LongPressedViewItem()
}
