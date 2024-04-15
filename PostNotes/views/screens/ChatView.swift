//
//  ChatView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/04/2024.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageSent = ""
    @State private var isShowingSuggestions = true
    
    
    var body: some View {
            
            VStack{
                // Button
                HStack{
                    
                    NavigationLink(destination: WelcomePageSearch()) {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.primary1)
                    }
                    
                    
                    Image(.sun)
                        .resizable()
                        .frame(width: 45, height: 45)
                    
                    
                    
                    VStack(alignment: .leading){
                        Text("AI Assistant")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundStyle(.brandSecondary)
                        
                        Text("Premium Subscriber")
                        //.font(.system(size: 17))
                            .font(.footnote)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundStyle(.indigo)
                    }.padding(.vertical)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.brandSecondary)
                        
                    })
                    
                    
                    
                    
                    
                }
                .padding()
                .offset(y: 30)
                .frame(height: 150)
                
                .background(.brandPrimary)
               
              //  .padding(.horizontal)
                  //  .padding()
                
                
                
                
                
                    
                    
                    
                    
                    //Spacer()
                    
                    VStack (spacing: 20){
                        
                        Spacer()
                        
                        SuggestionView(messageSent: $messageSent, suggestionTitle: "Brainstorm names", suggestionContent: "for my fantasy football team with a frog theme")
                        SuggestionView(messageSent: $messageSent, suggestionTitle: "Suggest some codenames", suggestionContent: "for a project introducing flexible work arrangements")
                        SuggestionView(messageSent: $messageSent, suggestionTitle: "Explain why popcorn pops", suggestionContent: "to a kid who loves watching it in the microwave")
                        
                        Spacer()

                    }.onTapGesture {

                    }
                        
                    Spacer()
                    
                   
                    HStack(spacing: 10){
                        
                        TextField("Ask anything", text: $messageSent, axis: .vertical)
                            .padding(10)
                            .lineLimit(5, reservesSpace: false)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(.brandPrimary, lineWidth: 0.5))
                            
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundStyle(.brandPrimary)
                        })
                        
                        
                    }   .padding()
                        .padding(.bottom, 50)
            }                 .ignoresSafeArea()

           
            
            .tint(.brandSecondary)
               
        

        
    }
}

#Preview {
    ChatView()
}




struct SuggestionView: View {
    @Binding var messageSent: String
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
        .background(
            RoundedRectangle(cornerRadius: 36)
                //.stroke(.brandSecondary)
                .foregroundStyle(.ultraThinMaterial))
        .padding(.horizontal)
        .onTapGesture {
            messageSent = "\(suggestionTitle) \(suggestionContent)"
            
            
        }
    }
}
