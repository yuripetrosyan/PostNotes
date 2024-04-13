//
//  ChatView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
           
            VStack{
                VStack{
                    Image(systemName: "text.quote")
                        .resizable()
                        .frame(width: 28, height: 28)
                    
                    Text("Explain")
                        .font(.system(size: 14))
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                }
                
            }
            
            
                       .toolbar {
                           
                           // Button
                           ToolbarItem(placement: .topBarLeading) {
                               Button(action: {
                                    
                               }, label: {
                                   Image(systemName: "arrow.left")
                                    
                               })
                           }
                           
                           
                           ToolbarItem(placement: .topBarLeading) {
                               Image(.sun)
                                   .resizable()
                                   .frame(width: 45, height: 45)
                           }
                           
                           
                           ToolbarItem(placement: .topBarLeading) {
                               VStack(alignment: .leading){
                                   Text("AI Assistant")
                                       .font(.system(size: 20))
                                       .fontWeight(.semibold)
                                       .fontDesign(.rounded)
                                   
                                   Text("Online")
                                       .font(.system(size: 17))
                                       .fontWeight(.medium)
                                       .fontDesign(.rounded)
                                       .foregroundStyle(.green)
                               }.padding(.vertical)
                           }
                           
                           
                           ToolbarItem(placement: .topBarTrailing) {
                               Button(action: {

                               }, label: {
                                   Image(systemName: "speaker.wave.2")
                               })
                           }
                           
                       }
        } .padding(.vertical)

        
    }
}

#Preview {
    ChatView()
}



