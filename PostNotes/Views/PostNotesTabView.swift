//
//  ContentView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI

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
