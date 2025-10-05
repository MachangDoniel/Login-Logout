//
//  UserSession.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import Foundation
import Combine

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var token: String? = nil
    @Published var alertMessage: AlertMessage?

    func login(usernameOrEmail: String, password: String) {
        APIManager.shared.login(usernameOrEmail: usernameOrEmail, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    self?.token = token
                    self?.isLoggedIn = true
                    self?.alertMessage = AlertMessage(message: NSLocalizedString("LOGIN_SUCCESSFULL_ALERT", comment: ""))
                    print("User logged in successfully! Token: \(token)")
                    
                case .failure(let error):
                    let msg = (error as NSError).domain == "Invalid credentials"
                        ? "Invalid username or password"
                        : error.localizedDescription
                    self?.alertMessage = AlertMessage(message: NSLocalizedString("INVALID_CREDENTIALS_ALERT", comment: ""))
                    print("Login failed: \(error.localizedDescription)")
                    print("msg: \(msg)")
                }
            }
        }
    }

    func register(username: String, email: String, password: String) {
        APIManager.shared.register(username: username, email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.alertMessage = AlertMessage(message: NSLocalizedString("REGISTRATION_SUCCESSFULL_ALERT", comment: ""))
                    print("User registered successfully!")
                case .failure(let error):
                    self?.alertMessage = AlertMessage(message: NSLocalizedString("REGISTRATION_FAILED_ALERT", comment: ""))
                    print("Registration failed: \(error.localizedDescription)")
                }
            }
        }
    }

    func logout() {
        token = nil
        isLoggedIn = false
        alertMessage = AlertMessage(message: NSLocalizedString("LOGOUT_ALERT", comment: ""))
        print("User logged out.")
    }
}
