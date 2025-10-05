//
//  AppTextField.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import SwiftUI

struct AppTextField: View {
    var placeholder: LocalizedStringKey
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .textFieldStyle(.roundedBorder)
        } else {
            TextField(placeholder, text: $text)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
        }
    }
}


#Preview {
    @Previewable @State var text: String = ""
    AppTextField(placeholder: "Sample", text: $text)
}


