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
                .foregroundStyle(.white).opacity(0.9)
            
            TopRoundedRectangle(radius: 25)
                .frame(width: 170, height: 50)
                .offset(CGSize(width: 0.0, height: -60.0))
                .foregroundColor(.black)
        }
            
            
        
        .shadow(radius: 5, x: 3, y: 5).opacity(0.3)
        .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 25))
            
            
            
                
                Image(systemName: "plus.app.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.brandPrimary).opacity(0.8)
                
                    .scaleEffect(pulsate ? 1 : 0.8)
                    .opacity(value)
                    
//                    .onAppear{
//                        withAnimation(.interactiveSpring(duration: 1.2).repeatForever().speed(0.5))
//                        {
//                            self.value = 1
//                            self.pulsate.toggle()
//                        }
//                    }

                
            
            
                   
                        

                      
            
                   
        
        }
        
        
   }
 }

#Preview {
    firstNoteAdd()
}
