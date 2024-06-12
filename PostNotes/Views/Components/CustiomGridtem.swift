//
//  gridItem.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI

struct CustomGridItemView: View {
    
let item: Note
 var body: some View {
         VStack(alignment: .leading){
          HStack{
                Text(item.title)
                    .font(.headline)
                    .fontDesign(.serif)
                    .shadow(radius: 5)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    
                Spacer()
                
            }   .frame(height: 50)
            
               
            
                Text(item.content)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .lineSpacing(4)
                    .padding(.horizontal, 7)
                    .foregroundStyle(.black)
                    
                    
           
                
          }
     
        .frame(width: 170, height: 170, alignment: .topLeading)
      
        
            .background {
                CustomNotepad()
            }
        
    }
    
}

//
//struct CustomGridItem: Identifiable {
//    let id = UUID()
//    let itemTitle: String
//    let itemContent: String
//}
//
//
//
//
//#Preview {
//    CustomGridItemView(item: Note)
//}
//
//


//
//#Preview {
//    CustomGridItemView(item: Note(title: "Hi", content: "Hohoho", date: .now))
//}
