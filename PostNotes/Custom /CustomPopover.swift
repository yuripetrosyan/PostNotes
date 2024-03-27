////
////  CustomPopover.swift
////  PostNotes
////
////  Created by Yuri Petrosyan on 26/03/2024.
////
//
//import SwiftUI
//
//struct CustomPopover: View {
//    
//    @State var searchedText:String = ""
//    @State var newFolderName: String = ""
//    
//    @State var popoverName: String
//    @State var popoverDescription: String
//    
//    var body: some View {
//        GeometryReader { geo in
//            ZStack{
//                
//                //Quich add alert (used for folders or notes)
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color(.brandSecondary))
//                    .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.40, alignment: .center)
//                VStack{
//                    
//                    
//                    VStack{
//                        Text(popoverName)
//                            .font(.headline)
//                            .foregroundStyle(.white)
//                        Text(popoverDescription)
//                            .font(.subheadline)
//                            .foregroundStyle(.white)
//                    }.background(RoundedRectangle(cornerRadius: 20)
//                        .foregroundStyle(.brandPrimary)
//                        .frame(width: geo.size.width * 0.7, height: 60)
//                        )
//                    
//                    Spacer(minLength: 20)
//                 
//                        
//                    
//                    
//                    
//                    
//                    TextField("Name", text: $newFolderName)
//                        .frame(width: 200, height: 10)
//                        .padding()
//                        .background(.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 7))
//                    
//                    Spacer()
//                    Color.gray.frame(width: 200, height: CGFloat(1))
//                    HStack{
//                        Button(action: {print("qyabab")}) {
//                            Text("Cancel")
//                                .frame(maxWidth: .infinity)
//                        }
//                        Button(action: {print("Save")}) {
//                            Text("Save")
//                                .frame(maxWidth: .infinity)
//                        }
//                    }
//                }
//                .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.35)
//                
//            }
//            //bring to the middle
//            .frame(width: geo.size.width, height: geo.size.height)
//            
//        }
//    }
//}
//
//
//#Preview {
//    CustomPopover(popoverName: "Name", popoverDescription: "Let's decide a name for your new folder")
//}
