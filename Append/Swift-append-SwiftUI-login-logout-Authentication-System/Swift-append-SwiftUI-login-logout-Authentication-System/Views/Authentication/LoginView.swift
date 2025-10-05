//
//  LoginView.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: UserSession
    @State private var usernameOrEmail = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text(LocalizedStringKey("LOGIN_TITLE"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)

                VStack(spacing: 15) {
                    AppTextField(placeholder: "USERNAME_OR_EMAIL_PLACEHOLDER", text: $usernameOrEmail)
                    AppTextField(placeholder: "PASSWORD_PLACEHOLDER", text: $password, isSecure: true)


                    AppButton(title: LocalizedStringKey("LOGIN_BUTTON_TITLE"),
                              backgroundColor: .blue,
                              action: login)

                    NavigationLink(destination: RegisterView().environmentObject(session)) {
                        Text(LocalizedStringKey("REGISTRATION_FROM_HERE_TITLE"))
                            .font(.footnote)
                    }
                    .padding(.top, 5)
                }
                .padding(.horizontal, 30)
                Spacer()
            }
            .alert(item: $session.alertMessage) { alert in
                Alert(title: Text(LocalizedStringKey("MESSAGE_TITLE")), message: Text(alert.message), dismissButton: .default(Text(LocalizedStringKey("OK_TITLE"))))
            }
        }
    }

    private func login() {
        guard !usernameOrEmail.isEmpty, !password.isEmpty else {
            session.alertMessage = AlertMessage(message: NSLocalizedString("EMPTY_FIELDS_ALERT", comment: ""))
            return
        }
        session.login(usernameOrEmail: usernameOrEmail, password: password)
    }
}

#Preview {
    LoginView().environmentObject(UserSession())
}
