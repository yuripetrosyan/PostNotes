//
//  SettingsViewModel().swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 15/04/2024.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject{
    
    //Theme settings
    enum Theme: String, CaseIterable, Identifiable{
        case light = "Light"
        case dark = "Dark"
        case system = "Sysem"
        
        var id: String {self.rawValue}
    }
    
    @Published var selectedTheme: Theme = .system
    
    //Accent Color
    @Published var accentColor: Color = .brandPrimary
    
    // Profile Settings
    @Published var userName: String = "John Doe"
    @Published var userLocation: String = "California, USA"
    
    
    
    

    
    // MARK: - Persistence =
      private let defaults = UserDefaults.standard
    
    init() {
           // Load any previously saved preferences here
           if let storedTheme = defaults.string(forKey: "themePreference") {
               selectedTheme = Theme(rawValue: storedTheme) ?? .system
           }
           // Similar loading for other properties...
       }
    
    // MARK: - Save Functions
        func saveThemePreference() {
            defaults.set(selectedTheme.rawValue, forKey: "themePreference")
        }
    
}
