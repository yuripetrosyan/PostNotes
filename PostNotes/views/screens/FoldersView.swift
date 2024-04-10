////
////  foldersView.swift
////  PostNotes
////
////  Created by Yuri Petrosyan on 25/03/2024.
////
//
//import SwiftUI
//
//
//// MARK: - foldersView
//
//struct FoldersView: View {
//    
//    var folders = ["Recent Notes", "All Notes", "Starred Notes", "Trash"]
//    @State var isShowingPopover = false
//    @State var newFolderName: String = ""
//    
//    var body: some View {
//        ZStack {
//            NavigationStack {
//                VStack {
//                    List {
//                        Section(header: Text("Notes on the phone")) {
//                            ForEach(folders, id: \.self) { folder in
//                                NavigationLink(destination: GridView(folderName: folder)) {
//                                    CustomFolderCell(name: folder)
//                                        .swipeActions(allowsFullSwipe: true) {
//                                            HStack {
//                                                Button {} label: {
//                                                    Text("Archive")
//                                                }
//                                                .tint(.blue)
//                                                
//                                                Button {} label: {
//                                                    Text("Delete")
//                                                }
//                                                .tint(.red)
//                                            }
//                                        }
//                                }
//                            }
//                        }
//                        .listRowSeparator(.hidden)
//                        .listRowSpacing(6)
//                        .navigationTitle("Folders")
//                        .navigationBarTitleDisplayMode(.inline)
//                        .tint(.brandPrimary)
//                        .toolbar {
//                            ToolbarItem(placement: .topBarTrailing) {
//                                Image(systemName: "folder.badge.plus")
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    // MARK: - CustomFolderCell
//    
//    struct CustomFolderCell: View {
//        var name: String
//        
//        var body: some View {
//            HStack {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 5.0)
//                        .frame(maxHeight: .infinity)
//                        .frame(width: 75)
//                    
//                    Image(systemName: "folder")
//                        .foregroundStyle(.white)
//                }
//                .padding(-15)
//                .padding(.leading, -10)
//                
//                Text(name)
//                    .padding(.horizontal, 20)
//                
//                Spacer()
//            }
//            .frame(height: 40)
//            .shadow(radius: 5, x: 3, y: 5)
//        }
//    }
//}
//// MARK: - Preview
//
//#Preview {
//    FoldersView()
//}
