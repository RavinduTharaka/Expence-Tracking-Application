//
//  SigninViewModel.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//
import Foundation
import SwiftUI

class SigninViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String = ""
    @Published var isSignedIn: Bool = false
    @Published var isNavigatingToHome = false

    func signInButtonTapped(completion: @escaping (Bool) -> Void) {
        errorMessage = ""

        let parameters = ["email": email, "password": password]

        guard let url = URL(string: "http://127.0.0.1:8000/api/login") else {
            errorMessage = "Invalid URL"
            completion(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            errorMessage = "Error creating the request body"
            completion(false)
            return
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                self.errorMessage = "Error: \(error)"
                completion(false)
                return
            }
            guard let data = data else {
                self.errorMessage = "No data received"
                completion(false)
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let token = json?["token"] as? String {
                    UserDefaults.standard.set(token, forKey: "token")
                    self.isSignedIn = true
                    completion(true)
                } else {
                    self.errorMessage = "Invalid Email or Password"
                    completion(false)
                }
            } catch let error {
                self.errorMessage = "Error serializing JSON: \(error)"
                completion(false)
            }
        }.resume()
    }

    func animate() {
        // Implement your view animations here
    }
}
