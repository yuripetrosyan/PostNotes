//
//  tttest.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 06/04/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var instance = Instance()
    @State var dotColor = Color.gray
    var repeatingAnimation: Animation {
            Animation
                .easeInOut(duration: 1.0)
                .repeatForever()
        }
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                Settings(auth: auth)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                        
                    }.tag(0)
                ZStack {
                    MapView(locationManager: locationManager)
                    Color.black.opacity(self.instance.status.opacity)
                    VStack {
                        Spacer()
                        Button(action: {
                            print("clicked")
                            withAnimation(self.repeatingAnimation) {
                                self.dotColor = Color.white
                            }
                            self.instance.changeStatus()
                        }){
                            HStack {
                                Text(self.instance.status.text)
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                Circle().frame(width: 12, height: 12)
                                    .foregroundColor(self.dotColor)
                                    .colorMultiply(self.dotColor)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                                
                            }
                        }.padding()
                    }
                }
            }
                
#Preview {
    HomeView()
}
