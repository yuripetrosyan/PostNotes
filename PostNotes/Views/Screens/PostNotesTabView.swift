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
            case .messageAI:
                //SearchView()
                //ChatView()
                ChatListView()
                
            case .plus:
                FoldersView(categories: FoldersViewModel.shared.folders)
            case .person:
                AccountView()
            case .gearshape:
                SettingsView()
            }
            
            
            //Use this to hide tabbar while in chat with ai
            
          //  if tabSelected != .messageAI{
                VStack{
                    
                    Spacer()
                    CustomTabBar(selectedTab: $tabSelected)
                        .padding(.bottom, -15)
                    
                }.ignoresSafeArea(.keyboard, edges: .bottom)
//            }else{
//                VStack(alignment: .center){
//                    
//                    HStack(alignment: .center){
//                        Image(systemName: "chevron.left")
//                            .padding()
//                            .padding(.top, 25)
//                            .foregroundStyle(.white)
//                            .onTapGesture {
//                                tabSelected = .house
//                            }
//                        
//                        Spacer()
//                    }
//                  
//                    Spacer()
//                    
//                }
//                
//            }
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


