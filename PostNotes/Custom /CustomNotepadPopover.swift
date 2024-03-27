//
//  CustomNotepadPopover.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 27/03/2024.
//

import SwiftUI



struct CustomNotepadPopover: View {
    
    @State var searchedText:String = ""
    @State var newFolderName: String = ""
    
    @State var popoverName: String
    @State var popoverDescription: String
    
    @Binding var isShowingPopover:Bool
    
    
    
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
                        
                    
                    
                    TextField("Name", text: $newFolderName)
                        .frame(width: 200, height: 10)
                        .padding()
                        .background(.brandSecondary)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(CGSize(width: 00.0, height: 10.0))
                    
                  
                    

                    VStack{
                        Color.gray.frame(width: 200, height: CGFloat(1))
                        
                        HStack{
                            Button(action: {isShowingPopover.toggle()}) {
                                Text("Cancel")
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(.brandPrimary)
                            }
                            Button(action: {print("Save")}) {
                                Text("Save")
                                    
                                    .frame(maxWidth: .infinity)
                                    .frame(height: geo.size.width * 0.10)
                                  
                                    .foregroundStyle(.white)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.brandPrimary))
                                    .frame(width: geo.size.width * 0.3)
                                  
                                    
                            }
                        }.padding(.horizontal)
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
    CustomNotepadPopover(popoverName: "Name", popoverDescription: "Write the name of you folder here", isShowingPopover: .constant(true))
}
