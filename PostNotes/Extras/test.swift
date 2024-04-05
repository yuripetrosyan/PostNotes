//
//  test.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 05/04/2024.
//

import SwiftUI

struct TestTest: View {
   
    @Namespace private var animation
    @State private var isScaled = false
    
    var xScale: Double { isScaled ? 1 : 0.7 }
    var yScale: Double { isScaled ? 1 : 0.4 }
  
var body: some View {
      
    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 120, height: 200)
                        .scaleEffect(CGSize(width: xScale, height: yScale))
                        .padding(.top, isScaled ? 20 : 0)
                        .opacity(isScaled ? 1 : 0.9)

            .onTapGesture {
                withAnimation(.spring()) {
                    isScaled.toggle()
                }
            }
            
        
    }
}

#Preview{TestTest()}


