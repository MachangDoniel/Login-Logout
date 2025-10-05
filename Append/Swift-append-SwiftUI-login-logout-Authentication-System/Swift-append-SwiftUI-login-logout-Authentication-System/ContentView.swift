//
//  ContentView.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: UserSession
    
    var body: some View {
        if session.isLoggedIn {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
