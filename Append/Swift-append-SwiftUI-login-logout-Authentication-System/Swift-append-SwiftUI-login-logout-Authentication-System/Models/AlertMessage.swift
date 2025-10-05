//
//  AlertMessage.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import SwiftUI

struct AlertMessage: Error, Identifiable {
    let id = UUID()
    var message: String
}
