//
//  APIManager.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import Foundation

struct APIResponse: Codable {
    let accessToken: String?
    let tokenType: String?
    let message: String?
    
    var token: String? { accessToken }
}


class APIManager {
    static let shared = APIManager()
    private init() {}
    
    let baseURL = API.getBaseURL
    
    func login(usernameOrEmail: String, password: String, completion: @escaping (Result<String, AlertMessage>) -> Void) {
        guard let url = URL(string: "\(baseURL)/api/auth/login") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["usernameOrEmail": usernameOrEmail, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        NetworkLogger.logRequest(request)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            NetworkLogger.logResponse(data: data, response: response, error: error)
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(AlertMessage(message: error.localizedDescription)))
                }
                return
            }
            
            guard let data = data else { return }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let message = json["message"] as? String {
                    DispatchQueue.main.async { completion(.failure(AlertMessage(message: message))) }
                } else {
                    DispatchQueue.main.async { completion(.failure(AlertMessage(message: "Unknown error"))) }
                }
                return
            }
            
            do {
                let responseObj = try JSONDecoder().decode(APIResponse.self, from: data)
                if let token = responseObj.token {
                    DispatchQueue.main.async { completion(.success(token)) }
                } else {
                    DispatchQueue.main.async { completion(.failure(AlertMessage(message: NSLocalizedString("INVALID_CREDENTIALS_ALERT", comment: "")))) }
                }
            } catch {
                DispatchQueue.main.async { completion(.failure(AlertMessage(message: error.localizedDescription))) }
            }
        }.resume()
    }



    func register(username: String, email: String, password: String, completion: @escaping (Result<Void, AlertMessage>) -> Void) {
        guard let url = URL(string: "\(baseURL)/api/auth/register") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["username": username, "email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        NetworkLogger.logRequest(request)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            NetworkLogger.logResponse(data: data, response: response, error: error)
            
            if let error = error {
                DispatchQueue.main.async { completion(.failure(AlertMessage(message: error.localizedDescription))) }
                return
            }
            
            guard let data = data else { return }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let message = json["message"] as? String {
                    DispatchQueue.main.async { completion(.failure(AlertMessage(message: message))) }
                } else {
                    DispatchQueue.main.async { completion(.failure(AlertMessage(message: NSLocalizedString("UNKNOWN_ERROR_ALERT", comment: "")))) }
                }
                return
            }
            
            DispatchQueue.main.async { completion(.success(())) } // registration success
        }.resume()
    }
}
