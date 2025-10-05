//
//  API.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import Foundation
import Foundation
import UIKit

struct API {
    /// Returns the base URL depending on device type
    static var getBaseURL: String {
        
        // MARK: Testing URL
        let port: String = "8080"
        if isSimulator {
            // Simulator can use localhost
            return "http://127.0.0.1:" + port
        } else {
            // Real device should use Mac's local network IP
            return "http://192.168.1.100:" + port
        }
        // Postman
        return "http://localhost:" + port
    }
    
    // Example API endpoints
    static var login: String { "\(getBaseURL)/api/auth/login" }
    static var register: String { "\(getBaseURL)/api/auth/register" }
    static var logout: String { "\(getBaseURL)/api/auth/logout" }
    
    /// Detect if running on simulator
    private static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
}
