//
//  gridView.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI
import RiveRuntime
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
    @State private var showPopover = false
    
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
        NavigationStack{
            ZStack{
                
                //BlurView(style: .systemMaterial).ignoresSafeArea()
                 //Color.red.ignoresSafeArea()
                RiveViewModel(fileName: "shapes").view()
                    .ignoresSafeArea()
                    .blur(radius: 30)
                
                //CameraView()
                CustomNotepadPopoverLonger(isShowingPopover: $showPopover)
                
                    .opacity(showPopover ? 1 : 0)
                    .offset(x: showPopover ? 30 : 300)
                    .rotation3DEffect(.degrees(showPopover ? 0 : 30), axis: (x: 0, y: 1, z: 0))
                //                //.ignoresSafeArea(.all, edges: .top)
                
                ZStack{
                    ScrollView {
                        SearchBar(text: $searchedText)
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
                    }//.ignoresSafeArea(edges: .bottom)
                }.opacity(showPopover ? 0.6 : 1)
                //3d effect when popover is open
                    //.mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .rotation3DEffect(.degrees(showPopover ? 30 : 0), axis: (x: 0, y:1, z: 0), perspective: 1)
                    .offset(x: showPopover ? -300 : 0)//, y: showPopover ? -100 : 0)
                    .scaleEffect(showPopover ? 0.9 : 1)
                    .scaleEffect(showPopover ? 0.92 : 1)
                
                
                
                
                //showing add popover
                if isShowingPopover{
                    CustomNotepadPopoverLonger(isShowingPopover: $isShowingPopover)
                }
            }
            .navigationTitle(category ?? "All Notes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                //            ToolbarItem(placement: .topBarTrailing) {
                //                Circle()
                //                    .frame(width: 40, height: 40)
                //                    .opacity(0)
                //                    .overlay {
                //                        Image(systemName: "plus")
                //                    }
                //                    .onTapGesture {
                //                        withAnimation(.easeInOut){
                //                            isShowingPopover.toggle()
                //                        }
                //                    }
                //                }
                ToolbarItem(placement: .topBarTrailing) {
                    Circle()
                        .frame(width: 40, height: 40)
                        .opacity(0)
                        .overlay {
                            Image(systemName: showPopover ? "xmark" : "plus")
                        }
                        .onTapGesture {
                            withAnimation(.spring(duration: 0.5, bounce: 0.3)){
                                showPopover.toggle()
                            }
                        }
                }
                
                
                
            }
        }
    }
}



#Preview {
    GridView()
}





