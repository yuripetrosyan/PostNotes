//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI


struct GridView: View {
    
    @State private var items: [CustomGridItem] = [
        
        CustomGridItem(itemTitle: "Ideas", itemContent: "Brainstorming session results: new marketing strategies, product improvement ideas, and potential collaborations. Let's discuss these in our next team meeting."),
        CustomGridItem(itemTitle: "Meeting", itemContent: "Reminder: Team meeting tomorrow at 10 AM. Please prepare the status updates for your projects. Looking forward to productive discussions!"),
        CustomGridItem(itemTitle: "To do ", itemContent: "I need to do groceries today"),
        CustomGridItem(itemTitle: "Exercise", itemContent: "30-minute jog in the morning followed by some light stretching. Stay consistent with your workout routine to maintain a healthy lifestyle."),
        CustomGridItem(itemTitle: "Travel", itemContent: "Plan for upcoming vacation: book flights, reserve accommodation, create itinerary. Ensure all travel documents are up-to-date for a hassle-free trip."),
        CustomGridItem(itemTitle: "Books", itemContent: "Reading list: 'The Alchemist' by Paulo Coelho, 'Atomic Habits' by James Clear, and 'Sapiens' by Yuval Noah Harari. Dive into these insightful reads during your free time."),
        CustomGridItem(itemTitle: "Budget", itemContent: "Review monthly expenses, track spending habits, and set savings goals. Take control of your finances to achieve financial stability and peace of mind."),
        CustomGridItem(itemTitle: "Projects", itemContent: "Ongoing projects: website redesign, client proposal development, and research paper submission. Stay focused and prioritize tasks to meet deadlines effectively."),
        CustomGridItem(itemTitle: "To do ", itemContent: "I need to do groceries today"),
        CustomGridItem(itemTitle: "Reminder", itemContent: "Call someone at 5 o'clock and be on time for ")
        
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: - body
    
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(items, id: \.id) { item in
                            CustomGridItemView(item: item)
                        }
                        
                        
                        
                    }
                    
                    .padding()
                    .padding(.top, 10)
                    
                    
                }
                
                
                
          //Round button here
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        RoundButton(imageName: "pencil")
                            .padding()
                    
                    }
                        .padding()
                        
                   
                }
                
            }
        .navigationTitle("My Notes").navigationBarTitleDisplayMode(.inline)
            
            
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                NavigationLink(destination: SettingsView()) {
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
