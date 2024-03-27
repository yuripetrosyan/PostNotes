//
//  gridItem.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI



struct CustomGridItemView: View {
  
    let item: CustomGridItem
    
    var body: some View {
        
        
        
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Text(item.itemTitle)
                    
                    .font(.headline)
                    .fontDesign(.serif)
                    .shadow(radius: 5)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                
                Spacer()
                
               
                
            }  .frame(height: 50)
            
               
            VStack{
                Text(item.itemContent)
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(4)
                    
                    .padding(.horizontal, 10)
                
                
                Spacer()
                
            }
            .frame(height: 120)
            
           
            
            
        }
        
        .frame(width: 170, height: 170)
            
            .background {
                CustomNotepad()
            }
        
    }
    
}


struct CustomGridItem: Identifiable {
    let id = UUID()
    let itemTitle: String
    let itemContent: String
}


#Preview {
    CustomGridItemView(item: CustomGridItem(itemTitle: "Holiday", itemContent: "I spent my holidays in a nice place. I had a week there and each day was like a "))
}

