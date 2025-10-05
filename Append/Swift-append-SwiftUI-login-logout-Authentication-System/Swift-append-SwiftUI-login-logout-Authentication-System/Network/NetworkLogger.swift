//
//  NetworkLogger.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import Foundation

class NetworkLogger {
    static func logRequest(_ request: URLRequest) {
        print("----- API REQUEST -----")
        if let method = request.httpMethod {
            print("Method: \(method)")
        }
        if let url = request.url {
            print("URL: \(url.absoluteString)")
        }
        if let headers = request.allHTTPHeaderFields {
            print("Headers: \(headers)")
        }
        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
            print("Body: \(bodyString)")
        }
        print("-----------------------")
    }
    
    static func logResponse(data: Data?, response: URLResponse?, error: Error?) {
        print("----- API RESPONSE -----")
        if let url = response?.url {
            print("URL: \(url.absoluteString)")
        }
        if let httpResponse = response as? HTTPURLResponse {
            print("Status Code: \(httpResponse.statusCode)")
            print("Headers: \(httpResponse.allHeaderFields)")
        }
        if let data = data,
           let bodyString = String(data: data, encoding: .utf8) {
            print("Body: \(bodyString)")
        }
        if let error = error {
            print("Error: \(error.localizedDescription)")
        }
        print("------------------------")
    }
}
