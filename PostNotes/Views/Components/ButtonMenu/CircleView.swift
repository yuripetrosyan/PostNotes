//
//  CircleView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 24/07/2024.
//

import SwiftUI

struct CircleView: View {
    @Binding var show: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: show ? 16 : 40)
            .frame(width: show ? 150 : 50, height: show ? 220 : 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .foregroundStyle(.ultraThickMaterial)
            .padding()
            .onTapGesture {
                withAnimation(.snappy){
                    show.toggle()
                }
            }
    }
}

//#Preview {
    //CircleView(show: .constant(false))
//}
