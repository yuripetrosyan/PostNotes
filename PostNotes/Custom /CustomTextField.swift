//
//  customTextField.swift
//  loginapp
//
//  Created by Yuri Petrosyan on 23/03/2024.
//

import SwiftUI

struct CustomTextField: View {
    var body: some View {
      
            
            RoundedRectangle(cornerRadius: 25.0)
                .strokeBorder(Color.brandPrimary, lineWidth: 2)
                .frame(width: 300, height: 50)
                .shadow(radius: 10)
                
        
        
    }
}

#Preview {
    CustomTextField()
}
