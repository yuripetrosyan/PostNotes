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
        
        VStack(alignment: .leading){
            HStack{
                Text(item.title)
                    .font(.title)
                    .fontDesign(.serif)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    // .offset(CGSize(width: 0.0, height: -20.0))
                   
                
                Spacer()
                
               
                
            }  
           
            .frame(height: 80)
            
               
            VStack{
                Text(item.content)
                    .font(.title3)
                    .lineLimit(nil)
                    .lineSpacing(6)
                    
                    //   .padding(.horizontal, 10)
                
                
                Spacer()
                
            }
            .frame(height: 170)
            
           
            
            
        }
        .frame(width: 300, height: 250)
            
            .background {
                LongPressedView()
                    
            }

        
    }
}



struct LongPressedView: View {
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 25) //25
                .frame(width: 330, height: 250)
                .foregroundStyle(.white).opacity(0.7)
            
            TopRoundedRectangle(radius: 25) //25
                .frame(width: 330, height: 80)
                .offset(CGSize(width: 0.0, height: -90))
                .foregroundColor(.brandPrimary)
            

                
        }.shadow(radius: 5, x: 3, y: 5)
        //?
    

    }
}





#Preview {
    LongPressedViewItem(item: Note(title: "Holiday", content: "I spent my holidays in a nice place. I had a week there and each day was like a,I had a week there and each day was like a,I had a week there and each day was like a ", date: .now))
}
