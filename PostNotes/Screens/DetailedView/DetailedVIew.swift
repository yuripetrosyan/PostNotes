import SwiftUI


struct DetailedVIew: View {
    
    let item: CustomGridItem

    
    var body: some View{
      NavigationStack  {
            VStack{
            VStack{
                Rectangle().frame(maxWidth: .infinity, maxHeight: 130)
                    .overlay {
                        HStack{
                            Text(item.itemTitle)
                                .foregroundStyle(.white)
                                .fontDesign(.serif)
                                .font(.title)
                            
                            
                            Spacer()
                            VStack{
                                Custom3circles()
                                
                                Spacer()
                            }
                            
                        }   .padding()
                            .padding(.top, 50)
                    }
                
            }
            
            Text(item.itemContent)
                .padding()
            
            Spacer()
            }.ignoresSafeArea()
              
        
    }
        
        
    }
    
}


#Preview {
    DetailedVIew(item: .init(itemTitle: "Holidays", itemContent: "Summer holidays are a cherished time for many, offering a break from the routines of daily life and a chance to embark on new adventures, explore exciting destinations, or simply unwind and rejuvenate. Reflecting on my own summer holidays brings back a flood of memories filled with laughter, discovery, and moments of sheer bliss.One of the most memorable aspects of my summer holidays is the sense of freedom they bring. Free from the constraints of school or work, each day unfolds like a blank canvas, waiting to be painted with experiences and memories. Whether it's a spontaneous road trip with friends, a family vacation to a distant locale, or a quiet retreat to the countryside, the possibilities seem endless during this time of year."))
}



