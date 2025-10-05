//
//  RegisterView.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var session: UserSession
    @Environment(\.dismiss) var dismiss 
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 30) {
            Text(LocalizedStringKey("CREATE_ACCOOUNT_TITLE"))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)

            VStack(spacing: 15) {
                AppTextField(placeholder: "USERNAME_PLACEHOLDER", text: $username)
                AppTextField(placeholder: "EMAIL_PLACEHOLDER", text: $email)
                AppTextField(placeholder: "PASSWORD_PLACEHOLDER", text: $password, isSecure: true)

                AppButton(title: LocalizedStringKey("SIGNUP_BUTTON_TITLE"),
                          backgroundColor: .green,
                          action: register)

                Button(action: { dismiss() }) {
                    Text(LocalizedStringKey("LOGIN_FROM_HERE_TITLE"))
                        .font(.footnote)
                }
                .padding(.top, 5)
            }
            .padding(.horizontal, 30)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .alert(item: $session.alertMessage) { alert in
            Alert(
                title: Text(LocalizedStringKey("MESSAGE_TITLE")),
                message: Text(alert.message),
                dismissButton: .default(Text(LocalizedStringKey("OK_TITLE")), action: {
                    if alert.message == NSLocalizedString("REGISTRATION_SUCCESSFULL_ALERT", comment: "") {
                        dismiss()
                    }
                })
            )
        }
    }

    private func register() {
        guard !username.isEmpty, !email.isEmpty, !password.isEmpty else {
            session.alertMessage = AlertMessage(message: NSLocalizedString("EMPTY_FIELDS_ALERT", comment: ""))
            return
        }
        session.register(username: username, email: email, password: password)
    }
}

#Preview {
    RegisterView().environmentObject(UserSession())
}
