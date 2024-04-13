//
//  CustomTabView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 06/04/2024.
//

import SwiftUI

//keep track on which tab is on

enum Tab: String, CaseIterable {
    case house = "house"
    case plus  = "folder"
    case magnifyingglass = "magnifyingglass.circle"
    case person = "person"
    case gearshape = "gearshape"
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .brandPrimary
        case .plus:
            return .brandPrimary
        case .magnifyingglass:
            return .red
       
        case .person:
            return .brandPrimary
        case .gearshape:
            return .brandPrimary
        }
    }
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 23)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? tabColor : .gray)
                        .font(.system(size: 23))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.ultraThinMaterial.shadow(.inner(color: .gray.opacity(0.4), radius: 6)))
            .cornerRadius(25)
            .padding()
            
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
