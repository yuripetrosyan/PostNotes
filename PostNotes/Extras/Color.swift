////
////  Color.swift
////  PostNotes
////
////  Created by Yuri Petrosyan on 22/05/2024.
////
//
//import SwiftUI
//
//import SwiftUI
//
//extension Color {
//    // ... your other custom colors ...
//a
//    static let defaultBrandOnly = Color("212121") // Define the default color
//    
//    static var brandOnly: Color {
//        get {
//            guard let hexString = UserDefaults.standard.string(forKey: "brandOnlyColor"),
//                  let color = try? Color(hexString) else { // Use try? here
//                      return Color.defaultBrandOnly
//                  }
//            return color
//        }
//        set {
//            // Save the new color as a hex string to UserDefaults
//            UserDefaults.standard.set(newValue.toHex, forKey: "brandOnlyColor")
//        }
//    }
//}
//
//extension Color {
//    var toHex: String? {
//        let components = self.cgColor!.components
//        guard let r = components?[0], let g = components?[1], let b = components?[2] else { return nil }
//        return  String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
//    }
//}
//
////
////#Preview {
////    Color()
////}
