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
    case magnifyingglass = "magnifyingglass.circle"
    case plus  = "plus.app"
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
        case .magnifyingglass:
            return .indigo
        case .plus:
            return .brandPrimary
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
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? tabColor : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.ultraThinMaterial)
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
