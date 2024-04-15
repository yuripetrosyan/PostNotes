//
//  SettingsView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 24/03/2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsViewModel = SettingsViewModel()

  //  @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            Form{
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $settingsViewModel.selectedTheme) {
                        ForEach(SettingsViewModel.Theme.allCases) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    .onChange(of: settingsViewModel.selectedTheme) { _ in
                        settingsViewModel.saveThemePreference()
                    }
                }
                                
            }
        
    
        
    }
}

#Preview {
    SettingsView()
}
