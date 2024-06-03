//
//  AuthView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 02/05/2024.
//
import SwiftUI
import RiveRuntime

struct AuthView: View {
    
    @ObservedObject var viewModel: AuthViewModel = AuthViewModel()
    @EnvironmentObject var appState: AppState
    @State private var sheetIsOn = false
    var body: some View {
        ZStack{
//            Image(.backgroundPhoto)
//                .resizable()
//                .ignoresSafeArea()
//                .aspectRatio(contentMode: .fill)
            
            //Background animation
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 30)
                .background(
                    Image("Spline")
                        .blur(radius: 50)
                        .offset(x: 200, y: 100)
                )
            
            
            VStack{
                HStack {
                    DefaultAnimationAnimationModifier()
                    Text("Ai")
                        .font(.custom("ARCADECLASSIC", size: 20))
                    
                }//.padding(.bottom)
                
                HStack{
                    CustomTextField()
                        .overlay{
                            TextField("Email", text: $viewModel.emailText)
                                .textContentType(.username)
                                .textInputAutocapitalization(.never)
                                .padding(.horizontal)
                                .padding(.top, 10)
                            
                        }
                    if !viewModel.isPasswordVisible{
                        Circle()
                            .frame(width: 40, height: 40)
                            .padding(.top, 10)
                            .onTapGesture {
                                viewModel.authenticate(appState: appState)
                            }
                            .overlay {
                                Image(systemName: "arrow.right")
                                    .foregroundStyle(.brandSecondary)
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                            }
                            
                    }
                    
                }
                if viewModel.isPasswordVisible {
                    VStack{
                        CustomTextField()
                            .overlay{
                                SecureField("password", text: $viewModel.passwordText)
                                    .textContentType(.password)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                            }
                        
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
                }
                if viewModel.isLoading {
                    ProgressView()
                } else{
                    //Button here
                    
                }
                
                HStack(spacing: 5){
                    Text("Already have an account?")
                        .font(.footnote)
                    
                        Text("Sign In!")
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .onTapGesture {
                                withAnimation(Animation.smooth){
                                    sheetIsOn.toggle()
                                        
                                }
                            }
                }.padding(.top, 20)
                
                
            }
            .padding(.top, 40)
            .padding(.horizontal)
            
            
            if sheetIsOn{
                SignInView(sheetIsOn: $sheetIsOn)
                    .transition(.move(edge: .bottom))
                    
            }
            
        }
    }
}


#Preview {
    AuthView()
}



//CustomTextField()
//    .overlay{
//        TextField("Email", text: $viewModel.emailText)
//            .textContentType(.username)
//            .textInputAutocapitalization(.never)
//            .padding(.horizontal)
//            .padding(.top, 10)
//    }


//Button(action: {
//    viewModel.authenticate(appState: appState)
//
//},label: {
//    Text(viewModel.userExists ? "Log In" : "Sign Up")
//    .fontWeight(.semibold)
//        .foregroundColor(.primary1)
//        .padding()
//        .frame(width: 150, height:  50)
//        .background(Color.brandPrimary)
//        .cornerRadius(30)
//        .padding(.horizontal)
//        .shadow(radius: 5, x: 3, y: 3)
//
//}).padding()
