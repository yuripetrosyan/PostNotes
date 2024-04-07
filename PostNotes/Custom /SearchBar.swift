//
//  SearchBar.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 06/04/2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false

    var body: some View {
        HStack {

            TextField("Search", text: $text)
                .padding(10)
                .padding(.horizontal, 25)
                .background(.ultraThinMaterial)
                .cornerRadius(25)
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
                }

            if isEditing {
                
                Button(action: {
                    
                    withAnimation(.smooth){
                        self.isEditing = false
                        self.text = ""
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

#Preview{
    SearchBar(text: .constant(""))
}
