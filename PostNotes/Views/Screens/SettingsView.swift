//
//  SettingsView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 24/03/2024.
//

import SwiftUI

struct SettingsView: View {
    
  //  @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(alignment: .center){
                    Image(._030Da420F864A1Cf5C1Bfe2B6B7754B3)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(30)
                    
                    Text("Name Surname")
                        .font(.custom("Urbanist", fixedSize: 36))
                        .fontWeight(.semibold)
                        .padding(10)
                    
                    Text("Amsterdam, The Netherlands")
                        .font(.footnote)
                    
                }
            
            
            
            Form{
                Section {
                    //
                    //                ColorPicker("Customise the notes", selection: .constant(.red))
                    //
                } header: {
                    Text("General")
                }
                
            }.navigationTitle("Settings").navigationBarTitleDisplayMode(.inline).tint(.brandPrimary)
        }
    }
        
    }
}

#Preview {
    SettingsView()
}
