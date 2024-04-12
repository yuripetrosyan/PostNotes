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
                            GridView()
                        case .magnifyingglass:
                            SearchView()
                        case .plus:
                    //    CustomNotepadPopoverLonger(isShowingPopover: .constant(true))
                GridView(isShowingPopover: true)
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
       

