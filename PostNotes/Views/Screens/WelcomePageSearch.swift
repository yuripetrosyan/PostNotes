//
//  WelcomePageSearch.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import SwiftUI

struct WelcomePageSearch: View {
    var body: some View {
        NavigationStack{
        VStack{
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
                    .font(.system(size: 15))
                
                
            }
            .padding(50)
            
            Spacer()
            
            Image(.sun)
                .resizable()
                .frame(width: 320, height: 320)
                .padding(.bottom, 40)
            
            Spacer()
            
            NavigationLink(destination: ChatView()){
                HStack{
                    
                    Spacer()
                    Text("Continue")
                        .font(.system(size: 19))
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                    
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.primary1)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(.brandPrimary))
                .padding(.horizontal, 30)
                .padding(.bottom, 80)
                
                
            }
            
            
        }
            
        }.navigationBarBackButtonHidden()
        
        
        
    }
}

#Preview {
    WelcomePageSearch()
}
