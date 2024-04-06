//
//  firstNoteAdd.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 05/04/2024.
//

import SwiftUI

struct firstNoteAdd: View {
    
    @State private var pulsate = false
    @State private var value = 0.2
    
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
        }
        
        .shadow(radius: 5, x: 3, y: 5).opacity(0.3)
        .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 25))
            
            Image(systemName: "plus.app.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
               //     .foregroundColor(.brandPrimary).opacity(0.8)
                    .scaleEffect(pulsate ? 1 : 0.5)
                    .opacity(value)
                    .onAppear { 
                        withAnimation(.easeInOut(duration: 0.8)){
                            self.value = 1
                            self.pulsate.toggle()
                        }
                        
                       
                    }

                        
//
                      
            
                   
        
        }
        
        
   }
 }

#Preview {
    firstNoteAdd()
}
