//
//  CustomNotepadPopover.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 27/03/2024.
//

import SwiftUI
import SwiftData

//MARK--  The longer version

struct CustomNotepadPopoverLonger: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss

    
    @State var newNoteTitle: String = ""
    @State var newNoteContent: String = ""
    @State var date: Date = .now
    
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                ZStack{
                    CustomNotepadWideLonger()
                    VStack{
                        VStack{
                            HStack{
                                TextField("Title", text: $newNoteTitle,
                                          prompt: Text("Title")
                                    .fontWeight(.semibold)
                                    .fontDesign(.serif)
                                    .font(.title2)
                                    .foregroundColor(.primary1)
                                )
                                
                                .fontWeight(.semibold)
                                .fontDesign(.serif)
                                .font(.title2)
                                .frame(width: 180, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Spacer()
                            }
                            
                            .frame(width: 230, height: 50)
                            .padding()
                            
                            Spacer()
                            
                            TextEditor(text: $newNoteContent)
                                .frame(width: 240, height: 210, alignment: .topLeading)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.brandPrimary)
                                .padding(.top, -30)
                            
                            //  .padding(20)
                            Spacer()
                            
                        }
                        VStack{
                            
                            Color.gray.frame(width: 200, height: CGFloat(1))
                                .offset(y: -10.0)
                            
                            
                            HStack{
                                Button(action:
                                        {
                                    dismiss()
                                
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
                                    
                                  //  let note = Note(title: newNoteTitle, content: newNoteContent, date: date)
                                    
                                    let note = Note(title: newNoteTitle, content: newNoteContent, date: date)
                                    
                                    context.insert(note)
                                    
                                    try! context.save()
                                    
                                    
                                    dismiss()
                                    
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    
                                    
                                    
                                }) {
                                    Text("Save")
                                    
                                        .frame(width: 100,height: 40)
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundStyle(.primary1)
                                        .background(RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.brandPrimary))
                                    
                                    
                                    
                                }
                                
                            }
                            .frame(width: 200)
                            .padding(.horizontal)
                            
                            
                        }
                        
                        .offset(CGSize(width: 0.0, height: -20.0))
                    }
                    //test
                    
                    .frame(width: geo.size.width * 0.7, height: 400)
                    
                    
                }
                //bring to the middle
                .frame(width: geo.size.width, height: geo.size.height)
                
                
            }
        }
    }
}



#Preview{
    CustomNotepadPopoverLonger()
}
