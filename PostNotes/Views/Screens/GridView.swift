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
          NavigationStack{
        ZStack{
            
            //BlurView(style: .systemMaterial).ignoresSafeArea()
            // Color.backgroundPrimary.ignoresSafeArea()
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 30)
            
            //CameraView()
//
//                .padding(.top, 50)
//                .opacity(showCamera ? 1 : 0)
//                .offset(x: showCamera ? 0 : -300)
//                .rotation3DEffect(.degrees(showCamera ? 0 : 30), axis: (x: 0, y: 1, z: 0))
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
                   
                }
            }.opacity(isShowingPopover ? 0.2 : 1)
            //3d effect when camera is open
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .rotation3DEffect(.degrees(showCamera ? 30 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1)
                .offset(x: showCamera ? 300 : 0, y: showCamera ? -100 : 0)
                .scaleEffect(showCamera ? 0.9 : 1)
                .scaleEffect(showCamera ? 0.92 : 1)
            
            
            
            //showing add popover
            if isShowingPopover{
                CustomNotepadPopoverLonger(isShowingPopover: $isShowingPopover)
            }
        }
        .navigationTitle(category ?? "All Notes")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                Circle()
                    .frame(width: 40, height: 40)
                    .opacity(0)
                    .overlay {
                        Image(systemName: "plus")
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            isShowingPopover.toggle()
                        }
                    }
                }
            ToolbarItem(placement: .topBarLeading) {
                Circle()
                    .frame(width: 40, height: 40)
                    .opacity(0)
                    .overlay {
                        Image(systemName: showCamera ? "xmark" : "camera")
                    }
                    .onTapGesture {
                        withAnimation(.spring(duration: 0.5, bounce: 0.3)){
                            showCamera.toggle()
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





