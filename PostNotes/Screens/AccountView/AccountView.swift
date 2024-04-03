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
  
   
       
    
    var body: some View {
        ZStack {
            
           // EllipticalGradient(colors:[Color.brandSecondary, Color.white], center: .center, startRadiusFraction: 0.0, endRadiusFraction: 0.6).ignoresSafeArea()
            
            
            VStack{
                
                HStack {
                    Text("PostNotes")
                        .font(.custom("ARCADECLASSIC", size: 36))
                        .fontDesign(.serif)
                        .fontWeight(.semibold)
                    
                    Text("Ai")
                        .font(.custom("ARCADECLASSIC", size: labelPressed ? 40 : 20))
                       
                       
                
                }
                .shadow(color: .primary, radius: glowIsOn ? 3 : 0)
                
                .onTapGesture {
                    withAnimation(.bouncy){
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
                    Text("log in")
                        .fontDesign(.serif)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: labelPressed ? 180 : 150, height:  50)
                        .background(Color.brandPrimary)
                        .cornerRadius(30)
                        .padding(.horizontal)
                        .shadow(radius: 5, x: 3, y: 3)
                }).padding()
                
                
                
            }
            .padding(.top, 40)
        .padding(.horizontal)
        }
    }
}


#Preview {
    AccountView()
}



