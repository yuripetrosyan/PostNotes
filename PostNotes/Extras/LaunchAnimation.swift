//
//  LaunchAnimation.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 01/06/2024.
//

import SwiftUI



struct LaunchAnimation: View {
    
    @Binding var isLaunchViewPresented: Bool
    
    @State private var isAnimating = true
    @State private var scale = CGSize(width: 1.0, height: 1.0)
    @State private var opacity = 1.0
    @State private var opacityToggled = false
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 170, height: 170)
                        .foregroundStyle(.brandSecondary)
                        .offset(CGSize(width: 0.0, height: isAnimating ? 200.0 : 0.0))
                        .scaleEffect(scale)
                    // .offset(CGSize(width: 00.0, height: 90.0))
                    
                    TopRoundedRectangle(radius: 25)
                        .foregroundStyle(.brandPrimary)
                        .frame(width: 170, height: 50)
                        .offset(CGSize(width: 0.0, height: isAnimating ? -200.0 : -60.0))
                        .foregroundColor(.brandOnly)
                        .opacity(opacityToggled ? 0.8 : opacity)
                }
            }
        }.onAppear{
            animateView()
        }
    }
    
    
    //MARK: - Animation Funtion
    func animateView(){
        withAnimation(.easeOut(duration: 0.8)){
            isAnimating.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                withAnimation(.easeInOut.repeatCount(3)){
                    opacityToggled.toggle()
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                withAnimation {
                    opacityToggled.toggle()
                }
                opacity = 0
                withAnimation(.easeOut(duration: 0.5)){
                    scale = CGSize(width: 10.0, height: 10.0)
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8, execute: {
                withAnimation(.easeOut(duration: 0.2)){
                    isLaunchViewPresented.toggle()
                }
            })
        }
    }
}

#Preview {
    LaunchAnimation(isLaunchViewPresented: .constant(true))
}
