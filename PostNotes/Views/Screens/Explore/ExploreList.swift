//
//  ExploreList.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 30/05/2024.
//

import SwiftUI

struct ExploreList: View {

   var cards = cardsData
   @State var showContent = false

   var body: some View {
      ScrollView {
         VStack {
            HStack {
               VStack(alignment: .leading) {
                  Text("Explore")
                     .font(.largeTitle)
                     .fontWeight(.heavy)

                  Text("Updated features")
                     .foregroundColor(.gray)
               }
               Spacer()
            }
            .padding(.leading, 60.0)

            ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 30.0) {
                   ForEach(cards) { item in
                       Button(action: { self.showContent.toggle() }) {
                           GeometryReader { geometry in
                               CardView(title: item.title,
                                        image: item.image,
                                        color: item.color,
                                        shadowColor: item.shadowColor)
                               .rotation3DEffect(Angle(degrees:
                                                        Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 20.0, z: 0))
                               .sheet(isPresented: self.$showContent) { ChatListView() }
                           }
                           .frame(width: 246, height: 360)
                       }
                   }
               }
               .padding(.leading, 30)
               .padding(.top, 30)
               .padding(.bottom, 70)
               Spacer()
            }
            
         }
         .padding(.top, 50)
      }
   }
}

#if DEBUG
struct ExploreList_Previews: PreviewProvider {
   static var previews: some View {
      ExploreList()
   }
}
#endif

struct CardView: View {

   var title = "Build an app with SwiftUI"
   var image = "Illustration1"
   var color = Color("background3")
   var shadowColor = Color("backgroundShadow3")

    var body: some View {
        VStack(alignment: .leading) {
                ZStack{
                    TopRoundedRectangle(radius: 30)
                        .opacity(0.5)
                        .foregroundStyle(.brandPrimary)
                        .frame(height: 120)
                        .offset(CGSize(width: 0.0, height: -20.0))
                    
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .lineLimit(4)
                        .padding(.bottom, 20)
                }
                
                Spacer()
                
                Image(image)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 246, height: 150)
                    .padding(.bottom, 30)
        }.padding(.bottom, 30)
               
            .background(color)
            .cornerRadius(30)
            .frame(width: 246, height: 360)
            .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
        }
    
}

struct Card: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var color: Color
   var shadowColor: Color
}

let cardsData = [
   Card(title: "Refine your notes with an AI chatbot",
          image: "Illustration2",
          color: Color("background3"),
          shadowColor: Color("backgroundShadow3")),
   Card(title: "Photo Notes",
          image: "Illustration3",
          color: Color("background4"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
   Card(title: "Securely store and access your notes from any device",
          image: "Illustration4",
          color: Color("background8"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
   Card(title: "AI-Powered Summarization (Soon)",
          image: "Illustration2",
          color: Color("background7"),
          shadowColor: Color("backgroundShadow4")),
   
   Card(title: "New Update",
          image: "Illustration5",
          color: Color("background9"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]
