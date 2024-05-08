//
//  AuthView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 02/05/2024.
//

import SwiftUI



struct AuthView: View {
    
    @ObservedObject var viewModel: AuthViewModel = AuthViewModel()
    //@State private var sheetIsOn = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack{
            Image(.backgroundPhoto)
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
               
        
        VStack{
            HStack {
                Text("PostNotes")
                // .font(.custom("Urbanist", size: 36))
                    .font(.custom("ARCADECLASSIC", size: 36))
                    .fontDesign(.serif)
                    .fontWeight(.semibold)
                Text("Ai")
                    .font(.custom("ARCADECLASSIC", size: 20))
                
            }
            
            
            CustomTextField()
                .overlay{
                    TextField("Email", text: $viewModel.emailText)
                        .textContentType(.username)
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal)
                        .padding(.top, 10)
                }
            
            if viewModel.isPasswordVisible {
                CustomTextField()
                    .overlay{
                        SecureField("password", text: $viewModel.passwordText)
                            .textContentType(.password)
                            .textInputAutocapitalization(.never)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
            }
            
            
            if viewModel.isLoading {
                ProgressView()
            } else{
                Button(action: {
                    viewModel.authenticate(appState: appState)
                    
                },label: {
                    Text(viewModel.userExists ? "Log In" : "Sign Up")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary1)
                        .padding()
                        .frame(width: 150, height:  50)
                        .background(Color.brandPrimary)
                        .cornerRadius(30)
                        .padding(.horizontal)
                        .shadow(radius: 5, x: 3, y: 3)
                }).padding()
            }
            
            
            
            //                HStack(spacing: 5){
            //                    Text("No account?")
            //                        .font(.footnote)
            //
            //                        Text("Create one!")
            //                            .fontWeight(.semibold)
            //                            .font(.footnote)
            //                            .onTapGesture {
            //                                withAnimation(Animation.smooth){
            //                                    sheetIsOn.toggle()
            //
            //                                }
            //                            }
            //                    }
            
            
        }
        .padding(.top, 40)
        .padding(.horizontal)
        
    }
        
        
        //            if sheetIsOn{
        //                FlatSignUpView(sheetIsOn: $sheetIsOn)
        //                    .transition(.move(edge: .bottom))
        //                    
        //            }
        
        
        
        
        
    }
}


#Preview {
    AuthView()
}



