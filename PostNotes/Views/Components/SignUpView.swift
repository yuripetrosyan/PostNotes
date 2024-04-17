//
//  SwiftUIView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/04/2024.
//

import SwiftUI

struct FlatSignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var passwordAgain = ""
    @Binding var sheetIsOn: Bool
    
    var body: some View {
 
            VStack{
                    
                    HStack{
                        Text("Sign up")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth : .infinity, alignment: .leading)
                            .padding(.top)
                            .foregroundColor(Color.brandPrimary)
                            
                        
                        Spacer()
                        Image(systemName: "xmark")
                            .padding()
                            .onTapGesture {
                                withAnimation(Animation.smooth){
                                    sheetIsOn.toggle()
                                }
                            }
                    }
                    Text("Create a new account")
                        .font(.callout)
                        .frame(maxWidth : .infinity, alignment: .leading)
                
                    Divider()

                
             //   Divider().padding()
                
                VStack (spacing: 12) {
                    
                
                    TextField("Enter email", text: $email)
                        .modifier(FlatGlassView())
                    
                    
                    SecureField("Enter password", text: $password)
                        .modifier(FlatGlassView())
                    
                    
                    SecureField("Re-enter password", text: $passwordAgain)
                        .modifier(FlatGlassView())
                }
                .padding()
                
                
                Text("By signing up you accept the **Terms of Service** and **Privacy Policy**")
                    .font(.footnote)
                
                    Divider().padding(.horizontal).padding(.bottom)

                Button {
                    //TODO:- add action
                } label: {
                        Text("Next")
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.ultraThickMaterial.shadow(.inner(color: .gray.opacity(0.6) ,radius: 5))).colorInvert()
                            .foregroundStyle(.brandPrimary)
                            .fontWeight(.bold)
                            .cornerRadius(14)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 30)
                    
                           
                    
                }
                
            }
            
            .padding()
            .background(.ultraThinMaterial.shadow(.inner(color: .gray.opacity(0.6) ,radius: 5)))
            .foregroundColor(Color.primary.opacity(0.35))
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(35)
           // .transition(.scale)
        
            .padding(.horizontal, 30)
            .padding(.vertical)
        
        }
    }


#Preview {
    //FlatSignUpView(sheetIsOn: .constant(true))
    AccountView()
}