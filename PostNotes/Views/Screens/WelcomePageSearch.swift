//
//  WelcomePageSearch.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import SwiftUI

struct WelcomePageSearch: View {
    
    @Binding var sheetIsPresented:Bool
    
    var body: some View {
        NavigationStack{
        VStack{
            Spacer()
            VStack(alignment: .center){
                    Text("Your AI Assistant")
                        .font(.title)
                        .foregroundStyle(.indigo)
                        .fontDesign(.rounded)
                        .fontWeight(.medium)
                        .padding()
                    
                    Text("Using this software,you can ask you questions and receive articles using  artificial intelligence assistant")
                        .foregroundStyle(.primary.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15))}
                 .padding(50)
            Spacer()
            
            VStack{
                
                Spacer()
            
            ZStack{
                Image(.sun)
                .resizable()
                .frame(width: 320, height: 320)
                .offset(y: 70)

                HStack{
                 Spacer()
                        Text("Continue")
                            .font(.system(size: 19))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.brandPrimary)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(.ultraThinMaterial))
                    .padding(.horizontal, 30)
                    
                    .onTapGesture {
                        sheetIsPresented.toggle()
                    }
                }
            }.frame(height: 100)
         }
    }.navigationBarBackButtonHidden()
  }
}

#Preview {
    WelcomePageSearch(sheetIsPresented: .constant(true))
}
