//
//  ChatView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageSent = ""
    
    var body: some View {
     
            
           NavigationStack {
                
                VStack{
                    
                    Spacer()
                    
                    VStack (spacing: 20){
                        SuggestionView(suggestionTitle: "Brainstorm names", suggestionContent: "for my fantasy football team with a frog theme")
                        
                        SuggestionView(suggestionTitle: "Suggest some codenames", suggestionContent: "for a project introducing flexible work arrangements")
                        SuggestionView(suggestionTitle: "Explain why popcorn pops", suggestionContent: "fto a kid who loves watching it in the microwave")
                    }
                        
                    Spacer()
                    
                   
                    HStack(alignment: .bottom, spacing: 10){
                        
                        TextField("Ask anything", text: $messageSent, axis: .vertical)
                            .padding(10)
                            .lineLimit(5, reservesSpace: false)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(.brandPrimary, lineWidth: 0.5))
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundStyle(.indigo)
                        })
                        
                        
                    } .padding()
                        .padding(.bottom, 50)
                        
                 
                
                
                           .toolbar {
                               
                               // Button
                               ToolbarItem(placement: .topBarLeading) {
                                  
                                   
                                   NavigationLink(destination: WelcomePageSearch()) {
                                       Image(systemName: "arrow.left")
                                           .foregroundStyle(.indigo)
                                   }
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
                                       
                                       Text("Premium Subscriber")
                                           //.font(.system(size: 17))
                                           .font(.footnote)
                                           .fontWeight(.medium)
                                           .fontDesign(.rounded)
                                           .foregroundStyle(.indigo)
                                   }.padding(.vertical)
                               }
                               
                               
                               ToolbarItem(placement: .topBarTrailing) {
                                   Button(action: {

                                   }, label: {
                                       Image(systemName: "square.and.arrow.up")
                                           .foregroundStyle(.indigo)

                                   })
                                   
                                  
                               }
                               
                               
                               
                           }
            } .padding(.vertical)
                   .tint(.indigo)
                //.navigationBarBackButtonHidden(true)
        }

        
    }
}

#Preview {
    ChatView()
}




struct SuggestionView: View {
    
    let suggestionTitle: String
    let suggestionContent: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 15){
            HStack {
                Text(suggestionTitle)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.brandPrimary)
                
                Spacer()
                
                Image(systemName: "arrow.up.forward")
            }.padding(.horizontal)
            
            Text(suggestionContent)
                .font(.system(size: 14))
                .padding(.horizontal)
                .foregroundStyle(.brandPrimary.opacity(0.8))
            
        }
        .frame(height: 100)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 36)
                .stroke(.brandSecondary)
        )
        .padding(.horizontal)
        .onTapGesture {
            
        }
    }
}
