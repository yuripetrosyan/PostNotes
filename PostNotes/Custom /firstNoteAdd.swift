//
//  firstNoteAdd.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 05/04/2024.
//

import SwiftUI

struct firstNoteAdd: View {
    var body: some View {
       
        ZStack(alignment: .center){
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 170, height: 170)
                .foregroundStyle(.white).opacity(0.3)
            
            
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 170, height: 50)
                .offset(CGSize(width: 0.0, height: -60.0))
                .foregroundColor(.brandPrimary)
            //  .shadow(radius: 7, x: 3, y: 5)
        }
        
        .shadow(radius: 5, x: 3, y: 5).opacity(0.3)
        .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 25))
            
            
    
        Image(systemName: "plus.app.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.brandPrimary).opacity(0.8)
           
        
        }
        
        
   }
 }

#Preview {
    firstNoteAdd()
}
