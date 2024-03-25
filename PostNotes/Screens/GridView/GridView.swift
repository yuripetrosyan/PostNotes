//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI


struct GridView: View {
    
    @State private var items: [CustomGridItem] = [
        
        CustomGridItem(itemTitle: "Holidays", itemContent: "I spent my holidays in Paris and it was wonderful. I spent my holidays in Paris and it was wonderful, I spent my holidays in Paris and it was wonderful"),
        CustomGridItem(itemTitle: "Graduation", itemContent: "I graduated from ... and i had a great time that day"),
        CustomGridItem(itemTitle: "To do ", itemContent: "I need to do groceries today"),
        CustomGridItem(itemTitle: "Reminder", itemContent: "Call someone at some o'clock and be on time for "),
        CustomGridItem(itemTitle: "Holidays", itemContent: "I spent my holidays in Paris and it was wonderful. I spent my holidays in Paris and it was wonderful, I spent my holidays in Paris and it was wonderful"),
        CustomGridItem(itemTitle: "Graduation", itemContent: "I graduated from ... and i had a great time that day"),
        CustomGridItem(itemTitle: "To do ", itemContent: "I need to do groceries today"),
        CustomGridItem(itemTitle: "Reminder", itemContent: "Call someone at some o'clock and be on time for "),
        CustomGridItem(itemTitle: "Graduation", itemContent: "I graduated from ... and i had a great time that day"),
        CustomGridItem(itemTitle: "To do ", itemContent: "I need to do groceries today"),
        CustomGridItem(itemTitle: "Reminder", itemContent: "Call someone at some o'clock and be on time for ")
        
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: - body
    
    
    
    var body: some View {
        
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(items, id: \.id) { item in
                        CustomGridItemView(item: item)
                            .onTapGesture {
                                print("toTheDetailedView")
                                
                            }
                    }
                }
                .padding()
                 .padding(.top, 10)
            }
            .navigationTitle("My Notes").navigationBarTitleDisplayMode(.inline)
          
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                       
                    NavigationLink(destination: SettingsView(brandPrimary: .constant(.brandPrimary))) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .tint(.brandPrimary)
                    }
                    }
                
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "plus")
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: foldersView()){
                        Image(systemName: "folder")
                            .tint(.brandPrimary)
                    }
                        
                }
                
                
               
                
                }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
