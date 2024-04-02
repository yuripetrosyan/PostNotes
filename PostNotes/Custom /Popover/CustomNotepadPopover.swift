//
//  CustomNotepadPopover.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 27/03/2024.
//

import SwiftUI



struct CustomNotepadPopover: View {
    
    @State var newNoteTitle: String = ""
        @State var newNoteContent: String = ""
        @State var popoverName: String
        @State var popoverDescription: String
        @Binding var isShowingPopover: Bool
        var onSave: ((String) -> Void)? // Closure to be executed on save
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                //Quich add alert (used for folders or notes)
                CustomNotepadWide()
                    .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.40, alignment: .center)
                VStack{
                    
                    
                    VStack(alignment: .center){
                        Text(popoverName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(popoverDescription)
                            .font(.subheadline)
                            .foregroundStyle(.white)
                    }
                    .offset(y: -15)
                        
                    
                    
                    TextField("Name", text: $newNoteTitle)
                        .frame(width: 200, height: 10)
                        .padding()
                        .background(.brandSecondary)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(CGSize( width: 00.0, height: 10.0))
                    
                  
                    

                    VStack{
                       
                        Color.gray.frame(width: 200, height: CGFloat(1))
                        
                        HStack{
                            Button(action: {isShowingPopover.toggle()}) {
                                Text("Cancel")
                                    .frame(width: 100)
                                    .foregroundStyle(.brandPrimary)
                            }
                            
                            Spacer(minLength: 20)
                            
                            Button(action: {
                                onSave?(newNoteTitle)
                                isShowingPopover.toggle()}) {
                                Text("Save")
                                    
                                    .frame(width: 100)
                                    .frame(height: 40)
                                  
                                    .foregroundStyle(.white)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.brandPrimary))
                                   
                                  
                                    
                            }
                            
                        }   
                            .frame(width: 200)
                        //.padding(.horizontal)
                            .padding(.top, 10)
                            
                    }.offset(CGSize(width: 00.0, height: 20.0))
                }
                .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.2)
                
            }
            //bring to the middle
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
    }
}




#Preview {
    CustomNotepadPopover(popoverName: "Title", popoverDescription: "Write the name of you folder here", isShowingPopover: .constant(true))
}
