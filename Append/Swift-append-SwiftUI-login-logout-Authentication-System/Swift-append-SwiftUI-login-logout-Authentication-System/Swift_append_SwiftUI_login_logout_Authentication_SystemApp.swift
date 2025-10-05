//
//  Swift_append_SwiftUI_login_logout_Authentication_SystemApp.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import SwiftUI

@main
struct Swift_append_SwiftUI_login_logout_Authentication_SystemApp: App {
    @StateObject var session = UserSession()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
        }
    }
}
