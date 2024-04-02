//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI


struct GridView: View {
    
    @State var isShowingPopover = false
    // @State var itemTitle: String = ""
    
    @State var searchedText: String = ""
    @State private var items: [CustomGridItem] = [
        
        CustomGridItem(itemTitle: "Ideas", itemContent: "Brainstorming session results: new marketing strategies, product improvement ideas, and potential collaborations. Let's discuss these in our next team meeting."),
        CustomGridItem(itemTitle: "Meeting", itemContent: "Reminder: Team meeting tomorrow at 10 AM. Please prepare the status updates for your projects. Looking forward to productive discussions!"),
        CustomGridItem(itemTitle: "Exercise", itemContent: "30-minute jog in the morning followed by some light stretching. Stay consistent with your workout routine to maintain a healthy lifestyle."),
        CustomGridItem(itemTitle: "Travel", itemContent: "Plan for upcoming vacation: book flights, reserve accommodation, create itinerary. Ensure all travel documents are up-to-date for a hassle-free trip."),
        CustomGridItem(itemTitle: "Books", itemContent: "Reading list: 'The Alchemist' by Paulo Coelho, 'Atomic Habits' by James Clear, and 'Sapiens' by Yuval Noah Harari. Dive into these insightful reads during your free time.")
        
        
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: - body
    
    
    
    var body: some View {
        ZStack{
            NavigationStack{
                ZStack{
                    
                    ScrollView {
                        
                        TextField("Search", text: $searchedText)
                            .padding()
                            .frame(height: 40)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(radius: 5, x: 3, y: 5)
                            .padding(.horizontal)
                            .padding(.top, 10)
                        
                        
                        Spacer()
                        
                        
                        
                        
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(items, id: \.id) { item in
                                
                                NavigationLink(destination: DetailedVIew(item: item)){
                                    CustomGridItemView(item: item)
                                    
                                    
                                    
                                    
                                }.buttonStyle(PlainButtonStyle())
                                
                            }
                            
                            
                            
                        }
                        
                        .padding()
                        
                        
                        
                        
                    }
                    
                    
                    //Round button here
                    
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button(action: {isShowingPopover.toggle()}, label: {
                                RoundButton(imageName: "pencil")
                            })
                            
                            
                            
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
                    
                    // ToolbarItem(placement: .topBarLeading) {
                    //     Image(systemName: "plus")
                    //   }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: foldersView()){
                            Image(systemName: "folder")
                                .tint(.brandPrimary)
                        }
                        
                    }
                    
                    
                    
                    
                }
            }
            
            
            if isShowingPopover{
                
              
                    CustomNotepadPopover(popoverName: "Note Title", popoverDescription: "Write the title of your note", isShowingPopover: $isShowingPopover){ newTitle in
                        
                       
                            items.append(CustomGridItem(itemTitle: newTitle, itemContent: ""))
                        
                }
                
                .transition(.move(edge: .bottom))
                .animation(.snappy)
                .background(.ultraThinMaterial)
                
            
            }
            
            
            
            
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
