//
//  MenuItemsView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 12/06/2024.
//

import SwiftUI
//
//struct MenuItemsView: View {
//  @State private var ShowHideMenu: Bool = true
//  @State private var iconPosition = true
//   
//
//    
//  var body: some View {
//    ZStack {
//      Color.black.ignoresSafeArea()
//      
//      // Items
//      ZStack {
//        
//        Circle()
//          .stroke()
//          .frame(width: 150, height: 150)
//          .foregroundColor(.white)
//          .opacity(0)
//        
//     
//        
//          Text("Analyze")
//        .font(.headline)
//          .frame(width: 130, height: 30)
//          .offset(x: -75)
//          .foregroundColor(.white)
//          .rotationEffect(.degrees(iconPosition ? 60: -180 ))
//          .animation(.easeInOut(duration: 1).delay(0.1))
//         
//
//          Text("Summerize")
//            .font(.headline)
//            .frame(width: 300, height: 30)
//            .offset(x: -95)
//            .foregroundColor(.white)
//            .rotationEffect(.degrees(iconPosition ? 30: -180 ))
//            .animation(.easeInOut(duration: 1).delay(0.3))
//
//        
//          Text("Correct")
//            .font(.headline)
//            .frame(width: 200, height: 30)
//            .offset(x: -75)
//            .foregroundColor(.white)
//            .rotationEffect(.degrees(iconPosition ? 0: -180 ))
//            //.rotationEffect(.degrees(45))
//            .animation(.easeInOut(duration: 1).delay(0.6))
//
//      }
//      .clipShape(Rectangle().offset(x: -20, y: -50))
//      .offset(x: 150, y: 335)
//      
//      
//      // Add Menu
//      VStack {
//        Spacer()
//        HStack {
//          Spacer()
//          Circle()
//            .frame(width: 60, height: 60)
//            .foregroundColor(.blue)
//            .overlay {
//              Image(systemName: "plus")
//                .foregroundColor(.white)
//                .fontWeight(.heavy)
//                .rotationEffect(.degrees(ShowHideMenu ? 45 : 0 ))
//            }
//            .onTapGesture {
//                withAnimation(.easeInOut(duration: 0.1)){
//                    ShowHideMenu.toggle()
//                    iconPosition.toggle()
//                }
//            }
//        }
//      }
//      .padding()
//    }
//  }
//}
//
//
//#Preview {
//    MenuItemsView(viewModel: <#DetailedViewViewModel#>)
//}
