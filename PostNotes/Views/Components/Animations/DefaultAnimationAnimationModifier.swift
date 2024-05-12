//
//  DefaultAnimationAnimationModifier.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 09/05/2024.
//

import SwiftUI

struct DefaultAnimationAnimationModifier: View {
   
   
    let txt = Array("PostNotes")
    
    @State private var flipAngle = Double.zero
    
    var body: some View {
        VStack(spacing: 32) {
            HStack(spacing: 0) {
                ForEach(0..<txt.count, id: \.self) { flip in
                    
                        Text(String(txt[flip]))
                            .font(.system(size: 36))
                            .fontDesign(.serif)
                            .fontWeight(.semibold)
                            .rotation3DEffect(.degrees(flipAngle), axis: (x: 0, y: 1, z: 0))
                            .animation(.default.delay(Double(flip) * 0.1), value: flipAngle)
                }
            }
        }
       
        .onAppear{
            flipAngle = (flipAngle == .zero) ? 360 : .zero
        }
        .onTapGesture {
            flipAngle = (flipAngle == .zero) ? 360 : .zero
        }
    }
}

#Preview {
    DefaultAnimationAnimationModifier()
        .preferredColorScheme(.dark)
}
