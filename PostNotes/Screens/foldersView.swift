//
//  foldersView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 25/03/2024.
//

import SwiftUI

struct foldersView: View {
    
    var folders = ["Recent Notes", "All Noted", "Starred Notes", "Trash"]
    var body: some View {
        
        NavigationStack{
            VStack{
                List{
                    
                    Section(header:
                                Text("Notes on the phone")){
                        ForEach(folders, id: \.self){ folderName in
                            CustomFolderCell(name: folderName)
                                .swipeActions{
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
