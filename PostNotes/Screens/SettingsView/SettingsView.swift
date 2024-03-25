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
        Form{
            Section {
               // DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    //      ColorPicker("Customise the notes", selection: .constant(.red))
                ColorPicker("Customise the notes", selection: .constant(.red))
                
            } header: {
                Text("General")
            }
            
        }.navigationTitle("Settings").navigationBarTitleDisplayMode(.inline).tint(.brandPrimary)
    }
        
    }
}

//#Preview {
   // SettingsView(colorScheme: .constant(.red))
//}
