//
//  ContentView.swiftx
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
import SwiftData


struct PostNotesTabView: View {
    @State private var tabSelected: Tab = .house
    @State private var selectedCategory: String? = "All Notes"
    
    init() {
        //will not reserve space on the screen for tabview
        UITabBar.appearance().isHidden = true
        
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        
    }
    
    var body: some View {
        ZStack{
            Spacer()
            // Based on the selected tab, display the corresponding view
            switch tabSelected {
            case .house:
                // GridView with refreshGrid as a parameter
                //GridView()
                FoldersView(categories: FoldersViewModel.shared.folders, selectedCategory: $selectedCategory)

               
            case .magnifyingglass:
                //SearchView()
                WelcomePageSearch()
            case .plus:
                FoldersView(categories: FoldersViewModel.shared.folders)
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
        
        .onAppear {
                    // Set selected category to "All Notes" when .house tab is selected
                    if tabSelected == .house {
                        selectedCategory = "All Notes"
                    }
                }
    }
}

#Preview {
    
    PostNotesTabView()
        .previewInterfaceOrientation(.portrait)
}


