//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
import SwiftData

struct GridView: View {
    
    @Environment(\.modelContext) var context
    @Query(sort: \Note.date, order: .reverse) var items: [Note]
     var category: String? // category optional
    @ObservedObject var foldersManager = FoldersViewModel.shared
    @State var isShowingPopover = false
    @State var folderNameFilter: String? = nil
    @State var searchedText: String = ""
    @State private var showingConfirmation = false
    @State private var showCamera = false
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var filteredItems: [Note] {
        items.filter { note in
            (category == nil || note.category == category) &&
            (searchedText.isEmpty || note.title.localizedCaseInsensitiveContains(searchedText) == true || note.content.localizedCaseInsensitiveContains(searchedText) == true )
        }
    }
            
       
    
    //MARK: - body
    var body: some View {
        //  NavigationStack{
        ZStack{
            
            BlurView(style: .systemMaterial).ignoresSafeArea()
            
            ZStack{
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                        // Check if items array is empty
                        if filteredItems.isEmpty {
                            // Add first note if it's empty
                            firstNoteAdd()
                                .onTapGesture {
                                    withAnimation(Animation.smooth){
                                        isShowingPopover.toggle()
                                    }
                                }
                         }else{
                            ForEach(filteredItems.filter { category == nil || $0.category == category }, id: \.id) { note in
                                NavigationLink(destination: DetailedVIew(item: note) { _ in })  {
                                    CustomGridItemView(item: note)
                                        .contextMenu {
                                            Button {
                                                
                                            } label: {
                                                Label("Favorite", systemImage: "heart")
                                            }
                                            Button{
                                                
                                            }  label: {
                                                Label("Edit", systemImage: "pencil")}
                                            Button {
                                                
                                            } label: {
                                                Label("Share", systemImage: "square.and.arrow.up")
                                            }
                                            Divider()
                                            Button(role: .destructive) {
                                                //      Delete note here
                                                context.delete(note)
                                                
                                            } label: {
                                                Label("Delete", systemImage: "trash")}
                                        }
                                }
                            }
                        }
                    }
                    
                    .foregroundStyle(.brandPrimary)
                    .padding()
                    .padding(.top, 55)
                }
                
                VStack{
                    SearchBar(text: $searchedText)
                    Spacer()
                }
                
            }.opacity(isShowingPopover ? 0.2 : 1)
            
            //showing add popover
            if isShowingPopover{
                CustomNotepadPopoverLonger(isShowingPopover: $isShowingPopover)
                
            }
            
        }
        .navigationTitle(category ?? "All Notes")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    withAnimation(Animation.smooth){
                        isShowingPopover.toggle()
                    }
                } label: {
                    Image(systemName: "plus")
                        .tint(.brandPrimary)
                }
            }
            
            
        }
      
    }
}



#Preview {
    GridView()
}





