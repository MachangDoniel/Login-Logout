//
//  AppButton.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import SwiftUI

struct AppButton: View {
    var title: LocalizedStringKey
    var backgroundColor: Color = .blue
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}


#Preview {
    AppButton(title: "Sample", backgroundColor: .blue) {
        print("Tapped")
    }
}
