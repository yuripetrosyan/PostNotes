//
//  SearchBar.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 06/04/2024.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var shadowOn = false

    @Binding var text: String

    @State private var isEditing = false

    var body: some View {
       
            
        ZStack {
            
            HStack {
                
                
                
                TextField("Search", text: $text)
                    .padding(10)
                    .padding(.horizontal, 25)
                    .background(.thinMaterial.shadow(.inner(color: .gray.opacity(0.3), radius: 6)))
                    .cornerRadius(25)
                    .shadow(color: shadowOn ? .indigo : .gray.opacity(0.5),
                            radius: shadowOn ? 40 : 3, x: shadowOn ? 3 : 2, y:shadowOn ? 3 : 3)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 10)
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                
                
                
                    .padding(.horizontal, 20)
                    .onTapGesture {
                        self.isEditing = true
                        withAnimation(.easeInOut(duration: 0.5)){
                            shadowOn.toggle()
                            
                        }
                    }
                
                if isEditing {
                    
                    Button(action: {
                        
                        withAnimation(.easeInOut(duration: 0.5)){
                            self.isEditing = false
                            self.text = ""
                            shadowOn = false
                        }
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("Cancel")
                            .foregroundStyle(.brandPrimary)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    //.animation(.default)
                }
            }.padding(.vertical)
        }
            
            
        
    
    }
}

#Preview{
    SearchBar(text: .constant(""))
}
