//
//  FlatGlassView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/04/2024.
//

import SwiftUI


struct FlatGlassView : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .foregroundStyle(.brandPrimary)
                .padding()
                .frame(height: 50)
                .background(.ultraThinMaterial.shadow(.inner(color: .gray.opacity(0.3) ,radius: 7)))
                .cornerRadius(14)
               
        } else {
            // Fallback on earlier versions
            content
                .foregroundStyle(.brandPrimary)
                .padding()
                .frame(height: 50)
                .cornerRadius(14)
            
        }
    }
}




//#Preview{FlatGlassView(sheetIsOn: .constant(true))}
