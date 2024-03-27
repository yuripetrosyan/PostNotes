//
//  ContentView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
//import CoreData
//import UserNotifications


struct PostNotesTabView: View {
    
    var body: some View{
        
        TabView{
            GridView()
                .tabItem {Label("Notes", systemImage: "note")}
           
            SearchView()
                .tabItem {Label("AI search", systemImage: "magnifyingglass")}
            
            AccountView()
                .tabItem {Label("Account", systemImage: "person")}

            
        } 
        
        .tint(.brandPrimary)
        
    }
}

#Preview {
    PostNotesTabView()
}
