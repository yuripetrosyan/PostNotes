//
//  accountView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//
import UIKit
import SwiftUI



struct AccountView: View {
    
    //fun animations
    @State private var labelPressed = false
    @State private var glowIsOn = false
    @State private var username: String = ""
    @State private var password: String = ""
     @State private var sheetIsOn = false
    
    var body: some View {
        NavigationStack{
            
        ZStack {
            
            Image(.backgroundPhoto)
                .resizable()
                .ignoresSafeArea()
            VStack{
                HStack {
                    Text("PostNotes")
                        .font(.custom("ARCADECLASSIC", size: 36))
                        .fontDesign(.serif)
                        .fontWeight(.semibold)
                    // Text("Ai")
                    // .font(.custom("ARCADECLASSIC", size: labelPressed ? 40 : 20))
                    
                }
                .shadow(color: .brandPrimary.opacity(0.8), radius: glowIsOn ? 3 : 0)
                .onTapGesture {
                    withAnimation(Animation.smooth){
                        labelPressed.toggle()
                        glowIsOn.toggle()
                    }
                }
                
                
                CustomTextField()
                    .overlay{
                        TextField("username", text: $username)
                            .textContentType(.username)
                            .autocapitalization(.none)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
                CustomTextField()
                    .overlay{
                        SecureField("password", text: $password)
                            .textContentType(.password)
                            .autocapitalization(.none)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
                
                Button(action: {
                    withAnimation(.smooth){
                        labelPressed.toggle()
                        glowIsOn.toggle()
                    }
                },
                       
                       label: {
                    Text("Sign in")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary1)
                        .padding()
                        .frame(width: labelPressed ? 180 : 150, height:  50)
                        .background(Color.brandPrimary)
                        .cornerRadius(30)
                        .padding(.horizontal)
                        .shadow(radius: 5, x: 3, y: 3)
                }).padding()
                
                HStack(spacing: 5){
                    Text("No account?")
                        .font(.footnote)
                    
                        Text("Create one!")
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .onTapGesture {
                                withAnimation(Animation.smooth){
                                    sheetIsOn.toggle()
                                        
                                }
                            }
                    
                    
                        
                    
                    
                }
                
                
            }
            .padding(.top, 40)
            .padding(.horizontal)
            
            
            if sheetIsOn{
                FlatSignUpView(sheetIsOn: $sheetIsOn)
                    .transition(.move(edge: .bottom))
                    
            }
            
            
            
        }
    }
}
}


#Preview {
    AccountView()
}



