//
//  gridItem.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI



struct CustomGridItemView: View {
  
    
    let item: Note

  //  let item: CustomGridItem
    
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
                    .offset(CGSize(width: 0.0, height: -5.0))
                
                Spacer()
                
            }  .frame(height: 30)
            
               
           
                Text(item.content)
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(4)
                    .padding(.horizontal, 7)
                    .frame(width: 170,height: 100)
          }
        
        .frame(width: 170, height: 170)
            
            .background {
                CustomNotepad()
            }
        
    }
    
}


//struct CustomGridItem: Identifiable {
//    let id = UUID()
//    let itemTitle: String
//    let itemContent: String
//}


//
//
//#Preview {
//    CustomGridItemView(item: Note(title: "Holiday", content: "Activities such as swimming, snork, and sunbathing are popular during these sunny days. Barbecues and picnics by the shore create cherished moments of togetherness and relaxation. Adventure seekers may opt for hiking, camping, or exploring national parks to immerse themselves in nature's beauty. Regardless of the destination, the summer holiday provides a much-needed break from routine, allowing individuals to recharge and create lasting memories with loved ones."))
//}





#Preview {
    CustomGridItemView(item: Note(title: "Holiday", content: "Activities"))
}
