//
//  ContentView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI

//struct PostNotesTabView: View {
//    var body: some View{
//        TabView{
//            GridView()
//                .tabItem {Label("Notes", systemImage: "note")}
//           
//            SearchView()
//                .tabItem {Label("AI search", systemImage: "magnifyingglass")}
//            
//            AccountView()
//                .tabItem {Label("Account", systemImage: "person")}
//            
//        }
//        
//        .tint(.brandPrimary)
//    }
//}
//
//
//
//#Preview {
//    PostNotesTabView()
//}
//
struct PostNotesTabView: View {
    @State private var tabSelected: Tab = .house
    
    init() {
        //will not reserve space on the screen for tabview
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            Spacer()
            // Based on the selected tab, display the corresponding view
            switch tabSelected {
                        case .house:
                            GridView()
                        case .magnifyingglass:
                            SearchView()
                        case .plus:
                CustomNotepadPopoverLonger(isShowingPopover: .constant(true))
                        case .person:
                            AccountView()
                        case .gearshape:
                            SettingsView()
                        }
            VStack{
                
                Spacer()
                CustomTabBar(selectedTab: $tabSelected)
                    .padding(.bottom, -15)
                 
            }.ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

#Preview {
    PostNotesTabView()
        .previewInterfaceOrientation(.portrait)
}
       

