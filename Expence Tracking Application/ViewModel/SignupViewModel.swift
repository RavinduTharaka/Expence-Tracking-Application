//
//  SignupViewModel.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import Foundation
import SwiftUI


class SignupViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    func register(completion: @escaping (Bool) -> Void) {
        let parameters = [
            "name": name,
            "email": email,
            "password": password,
            "confirmPassword": confirmPassword
        ]

        guard let url = URL(string: "http://127.0.0.1:8000/api/register") else {
            completion(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(false)
                return
            }
            guard let data = data else {
                print("No data")
                completion(false)
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let token = json["token"] as? String {
                    UserDefaults.standard.set(token, forKey: "token")
                    DispatchQueue.main.async {
                        completion(true)
                    }
                }
            } catch let error {
                print("Error serializing JSON: \(error)")
                completion(false)
            }
        }.resume()
    }
}



//import SwiftUI
//
//struct SignupViewModel: View {
//
////    @State private var username: String = ""
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @State private var confirmPassword: String = ""
//
//    @State private var isRegistered = false
//
//    var body: some View {
//        NavigationView {
//            VStack {
////                TextField("Username", text: $username)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                TextField("Email", text: $email)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                SecureField("Confirm Password", text: $confirmPassword)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                Button(action: {
//                    registerTapped()
//                }) {
//                    Text("Register")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                if isRegistered {
//                    NavigationLink(destination: HomeView()) {
//                        Text("Go to Home")
//                    }
//                }
//            }
//            .padding()
//            .navigationTitle("Registration")
//        }
//    }
//
//    func registerTapped() {
//        let parameters = [
////            "name": username,
//            "email": email, "password": password, "confirmpassword": confirmPassword]
//
//        guard let url = URL(string: "http://127.0.0.1:8000/api/register") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let session = URLSession.shared
//        session.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//            guard let data = data else {
//                print("No data")
//                return
//            }
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                   let token = json["token"] as? String {
//                    UserDefaults.standard.set(token, forKey: "token")
//                    isRegistered = true
//                }
//            } catch let error {
//                print("Error serializing JSON: \(error)")
//            }
//        }.resume()
//    }
//}
//
//struct HomeView: View {
//    var body: some View {
//        Text("Welcome to the HomeView!")
//    }
//}
//
//@main
//struct YourApp: App {
//    var body: some Scene {
//        WindowGroup {
//            SignupViewModel()
//        }
//    }
//}
