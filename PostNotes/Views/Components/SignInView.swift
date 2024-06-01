//
//  SwiftUIView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/04/2024.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @Binding var sheetIsOn: Bool
    @ObservedObject var viewModel: AuthViewModel = AuthViewModel()
    @EnvironmentObject var appState: AppState

    var body: some View {
 
            VStack{
                    HStack{
                        Text("Log in")
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
                    Text("If you already have an account")
                        .font(.callout)
                        .frame(maxWidth : .infinity, alignment: .leading)
                
                    Divider()

                
             //   Divider().padding()
                
                VStack (spacing: 12) {
                    
                
                    TextField("Enter email", text: $viewModel.emailText)
                        .modifier(FlatGlassView())
                        .textContentType(.username)
                        .textInputAutocapitalization(.never)
                    
                    
                    SecureField("Enter password", text: $viewModel.passwordText)
                        .modifier(FlatGlassView())
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                    
                
                }
                .padding()
                
                
               // Text("By signing up you accept the **Terms of Service** and **Privacy Policy**")
                    //.font(.footnote)
                
                    Divider().padding(.horizontal).padding(.bottom)

                Button {
                    viewModel.authenticate2(appState: appState)
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
            .frame(maxWidth: 300)
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
   // SignInView(sheetIsOn: .constant(true))
    AccountView()
}
