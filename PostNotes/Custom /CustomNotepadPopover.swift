//
//  CustomNotepadPopover.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 27/03/2024.
//

import SwiftUI

//
//
//struct CustomNotepadPopover: View {
//    //@State private var items: [Note] = []
//    @State var newNoteTitle: String = ""
//    @State var newNoteContent: String = ""
//    @State var popoverName: String
//    @State var popoverDescription: String
//    @Binding var isShowingPopover: Bool
//    var onSave: ((String) -> Void)? // Closure to be executed on save
//    
//    
//    var body: some View {
//        GeometryReader { geo in
//            ZStack{
//                //Quich add alert (used for folders or notes)
//                CustomNotepadWide()
//                    .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.40, alignment: .center)
//                    
//                VStack{
//                    
//                    
//                    VStack(alignment: .center){
//                        
//                        
////                        Text(popoverName)
////                            .font(.headline)
////                            .foregroundStyle(.white)
////                        Text(popoverDescription)
////                            .font(.subheadline)
////                            .foregroundStyle(.white)
////                        
//                      
//                        TextField("Title", text: $newNoteTitle,
//                                  prompt: Text("Title")
//                            .fontWeight(.semibold)
//                            .fontDesign(.serif)
//                            .font(.title2)
//                            .foregroundColor(.brandSecondary)
//                           
//                        ).frame(width: 230, height: 10)
//                            .padding()
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                        
//                    }
//                      .offset(y: -15)
//                    
//                    TextField("Note", text: $newNoteTitle)
//                        .frame(width: 200, height: 10)
//                        .padding()
//                        .background(.brandSecondary)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .offset(CGSize( width: 00.0, height: 10.0))
//                    
//                    
//                    
//                    
//                    VStack{
//                        
//                        Color.gray.frame(width: 200, height: CGFloat(1))
//                        
//                        HStack{
//                            Button(action: 
//                                    {isShowingPopover.toggle()
//                                //Instantly dismiss the keyboard
//                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                                
//                                
//                                
//                                
//                            }) {
//                                Text("Cancel")
//                                    .frame(width: 100)
//                                    .foregroundStyle(.brandPrimary)
//                            }
//                            
//                            Spacer(minLength: 20)
//                            
//                            Button(action:  {
//                                
//                                
//                                onSave?(newNoteTitle)
//                                isShowingPopover.toggle()
//                                //Instantly dismiss the keyboard
//                                
//                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                                
//                                
//                            }) {
//                                Text("Save")
//                                
//                                    .frame(width: 100)
//                                    .frame(height: 40)
//                                
//                                    .foregroundStyle(.white)
//                                    .background(RoundedRectangle(cornerRadius: 20)
//                                        .foregroundStyle(.brandPrimary))
//                                
//                                
//                                
//                            }
//                            
//                        }   
//                        .frame(width: 200)
//                        //.padding(.horizontal)
//                        .padding(.top, 10)
//                        
//                    }
//                    
//                    .offset(CGSize(width: 00.0, height: 20.0))
//                }
//                .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.2)
//                
//            }
//            //bring to the middle
//            .frame(width: geo.size.width, height: geo.size.height)
//            
//            
//        }
//    }
//}


//MARK--  The longer version

struct CustomNotepadPopoverLonger: View {

    @State var newNoteTitle: String = ""
    @State var newNoteContent: String = ""
    @Binding var isShowingPopover: Bool
    var onSave: ((String, String) -> Void)?
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                CustomNotepadWideLonger()
                    
                VStack{
                    VStack{
                        
                        TextField("Title", text: $newNoteTitle,
                                  prompt: Text("Title")
                            .fontWeight(.semibold)
                            .fontDesign(.serif)
                            .font(.title2)
                            .foregroundColor(.white)
                                  
                        )  
                        .fontWeight(.semibold)
                        .fontDesign(.serif)
                        .font(.title2)
                        .foregroundColor(.white)
                            .frame(width: 230, height: 50)
                            .padding()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                        
            
                     
                            
                            TextEditor(text: $newNoteContent)
                            
                               
                                .frame(width: 240, height: 210, alignment: .topLeading)
                                .background(.red)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.brandPrimary)
                                .font(.headline)
                                .padding(.top, -30)
                            
                            //  .padding(20)
                            
                          
                            
                        
                        
                        
                        
                        Spacer()
                        
                    }
                    VStack{
                        
                        Color.gray.frame(width: 200, height: CGFloat(1))
                            .offset(y: -10.0)
                            
                        
                        HStack{
                            Button(action:
                                    {isShowingPopover.toggle()
                                //Instantly dismiss the keyboard
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                
                                
                                
                                
                            }) {
                                Text("Cancel")
                                    .frame(width: 100)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundStyle(.brandPrimary)
                            }
                            
                            Spacer(minLength: 20)
                            
                            Button(action:  {
                                
                                
                                onSave?(newNoteTitle, newNoteContent)
                                isShowingPopover.toggle()
                                //Instantly dismiss the keyboard
                                
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                
                                
                            }) {
                                Text("Save")
                                
                                    .frame(width: 100,height: 40)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .foregroundStyle(.white)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.brandPrimary))
                                
                                
                                
                            }
                            
                        }
                        .frame(width: 200)
                        .padding(.horizontal)
                    
                        
                    }
                    
                    .offset(CGSize(width: 0.0, height: -20.0))
                }
                .frame(width: geo.size.width * 0.7, height: 400)
                
                
            }
            //bring to the middle
            .frame(width: geo.size.width, height: geo.size.height)
            
            
        }
    }
}





//#Preview {
//    CustomNotepadPopover(popoverName: "Title", popoverDescription: "Write the name of you folder here", isShowingPopover: .constant(true))
//}

//
#Preview{
    CustomNotepadPopoverLonger(isShowingPopover: .constant(true))
}
