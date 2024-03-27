//
//  foldersView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 25/03/2024.
//

import SwiftUI

struct foldersView: View {
    
    var folders = ["Recent Notes", "All Noted", "Starred Notes", "Trash"]
    @State var isShowingPopover = false
    @State var newFolderName: String = ""
    
    var body: some View {
        ZStack{
        NavigationStack{
            ZStack{
                
                VStack{
                    List{
                        
                        Section(header:
                                    Text("Notes on the phone")){
                            ForEach(folders, id: \.self){ folderName in
                                CustomFolderCell(name: folderName)
                                    .swipeActions(allowsFullSwipe: true){
                                        HStack{
                                            Button{ }label: {
                                                Text("Archive")
                                            }.tint(.blue)
                                            
                                            Button{ }label: {
                                                Text("Delete")
                                            }.tint(.red)
                                            
                                            
                                        }
                                    }
                                
                                
                            }
                        }
                    }
                    // .listStyle(InsetGroupedListStyle())
                    
                    .listRowSeparator(.hidden)
                    .listRowSpacing(6)
                    .navigationTitle("Folders").navigationBarTitleDisplayMode(.inline).tint(.brandPrimary)
                    
                    
                }
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        
                        
                        Image(systemName: "folder.badge.plus")
                            .resizable()
                            .frame(width: 40, height: 30)
                            .offset(x: 3, y: -2)
                            .background(Circle().foregroundStyle(.brandSecondary.opacity(0.9)).frame(width: 60, height: 60))
                            .onTapGesture {
                                isShowingPopover.toggle()
                            }
                        
                            
                        
                       
                            .padding()
                        
                    }
                    .padding()
                    
                    
                }
                
            }
        }
            if isShowingPopover{
                CustomNotepadPopover(searchedText: newFolderName, popoverName: "Name", popoverDescription: "Let's decide a name for your new folder")
            }
        
        
        
    }
 }
}
#Preview {
    foldersView()
}




struct CustomFolderCell: View {
    var name: String
    
    var body: some View {
        
        
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(maxHeight: .infinity)
                    .frame(width: 80)
                
                Image(systemName: "folder")
                    .foregroundStyle(.white)
    
                    
            
            }.padding(-15)
                .padding(.leading, -10)
            
           
            Text(name)
                .padding(.horizontal, 20)
            
            Spacer()
            
           
        }.frame(height: 40)
    }
}
