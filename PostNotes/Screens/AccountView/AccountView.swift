//
//  accountView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//
import UIKit
import SwiftUI

var i = 1



struct AccountView: View {
    
  
    
    @State private var username: String = ""
    @State private var password: String = ""
  
   
       
    
    var body: some View {
        VStack{
            
            HStack {
                Text("PostNotes")
                    .font(.custom("ARCADECLASSIC", size: 36))
                    .fontDesign(.serif)
                    .fontWeight(.semibold)
                
                Text("Ai")
                    .font(.custom("ARCADECLASSIC", size: 20))
                   
                   
                    
                    
                    
                
            }
            
            TextField("username", text: $username)
        
                .textContentType(.username)
                .autocapitalization(.none)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
            //   .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
            
                .overlay {
                    CustomTextField()
                }
            
            SecureField("password", text: $password)
                .textContentType(.password)
                .autocapitalization(.none)
            
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
            //   .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
            
                .overlay {
                    CustomTextField()
                }
            
            
            Button(action: {},
                   
                   label: {
                Text("log in")
                    .fontDesign(.serif)
                    .fontWeight(.medium)
                    .shadow(radius: 3)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.brandPrimary)
                    .cornerRadius(30)
                    .padding(.horizontal)
            }).padding()
            
            
            
        }
        .padding(.top, 40)
        .padding(.horizontal)
    }
}


#Preview {
    AccountView()
}



