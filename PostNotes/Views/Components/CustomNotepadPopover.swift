//
//  CustomNotepadPopover.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 27/03/2024.
//
// CustomNotepadPopoverLonger.swift

import SwiftUI
import SwiftData

struct CustomNotepadPopoverLonger: View {
    @Environment(\.modelContext) var context
    @Binding var isShowingPopover: Bool
    
    @State var newNoteTitle: String = ""
    @State var newNoteContent: String = ""
    @State var date: Date = .now
    @State private var selectedCategory = ""
    
    var body: some View {
                    GeometryReader { geo in
                ZStack {
                    CustomNotepadWideLonger()
                    VStack {
                        VStack {
                            HStack {
                                TextField("Title", text: $newNoteTitle,
                                          prompt: Text("Title")
                                            .fontWeight(.semibold)
                                            .fontDesign(.serif)
                                            .font(.title2)
                                            .foregroundColor(.primary1)
                                )
                                .foregroundColor(.primary1)
                                .fontWeight(.semibold)
                                .fontDesign(.serif)
                                .font(.title2)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Picker("Select the category", selection: $selectedCategory) {
                                    ForEach(FoldersViewModel.shared.folders, id: \.self) { folder in
                                        Text(folder)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(.brandSecondary)
                            }
                            .frame(width: 230, height: 50)
                            .padding(.vertical)
                            
                            TextEditor(text: $newNoteContent)
                                .frame(minWidth: 250, minHeight: 210, alignment: .topLeading)
                                .offset(y: -20)
                                .scrollContentBackground(.hidden)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.brandPrimary)
                                .padding(20)
                            Spacer()
                        }
                        
                        VStack {
                            Color.gray.frame(width: 200, height: CGFloat(1))
                                .offset(y: -10.0)
                            
                            HStack {
                                Button(action: {
                                    withAnimation(Animation.smooth) {
                                        isShowingPopover = false
                                    }
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }) {
                                    Text("Cancel")
                                        .frame(width: 100)
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .foregroundStyle(.brandPrimary)
                                }
                                
                                Spacer(minLength: 20)
                                
                                Button(action: {
                                    let note = Note(title: newNoteTitle, content: newNoteContent, date: date, category: selectedCategory)
//                                   context.insert(note)
//                                    try! context.save()
//                                    
//                                    
//                                    
                                    do {
                                        try context.save()
                                        context.insert(note)
                                        try context.save()
                                    } catch {
                                        print("There was an error saving the listing")
                                        print(error.localizedDescription)
                                    }
                                    
                                    withAnimation(Animation.smooth) {
                                        isShowingPopover = false
                                    }
                                    
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }) {
                                    Text("Save")
                                        .frame(width: 100, height: 40)
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
                    .frame(width: geo.size.width * 0.7, height: 400)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            
        }
        .transition(.scale.combined(with: .move(edge: .bottom)))
    }
}

// Preview
#Preview{
    CustomNotepadPopoverLonger(isShowingPopover: .constant(true))
}
