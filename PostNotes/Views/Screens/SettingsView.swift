//
//  SettingsView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 24/03/2024.
//

import SwiftUI
import Glur

struct SettingsView: View {
    @ObservedObject var settingsViewModel = SettingsViewModel()

  //  @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack(alignment: .topTrailing){
            Image(._030Da420F864A1Cf5C1Bfe2B6B7754B3)
                .resizable()
                .frame(width: 200, height: 200)
                .glur(radius: 1)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack{
                Spacer()
                Text(Date().formatted(.dateTime.month().day()))
               
            }
            
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            
           
            
        }.frame(width: 200, height: 200)
        
    }
}

#Preview {
    SettingsView()
}
