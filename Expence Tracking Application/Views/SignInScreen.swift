////
////  SignInScreen.swift
////  Expence Tracking Application
////
////  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
////
//
//import SwiftUI
//
//struct SignInScreen: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var errorMessage = ""
//    @State private var isSignedIn = false
//
//    var body: some View {
//
//        @StateObject var loginVM: SigninViewModel = SigninViewModel()
//        NavigationView {
//            ZStack{
//                Color("PrimaryColor").ignoresSafeArea()
//                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
//                Circle().scale(1.35).foregroundColor(.white)
//                VStack{
//                Spacer()
//                    Text("Sign In")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .padding()
//                    //                Image("avatar")
//                    //                    .resizable()
//                    //                    .scaledToFit()
//                    TextField("Email", text: $email)
//                        .padding()
//                        .frame(width:300, height:50)
//                        .background(Color.black.opacity(0.05))
//                        .cornerRadius(10)
//
//
//                    SecureField("Password", text: $password)
//                        .padding()
//                        .frame(width:300, height:50)
//                        .background(Color.black.opacity(0.05))
//                        .cornerRadius(10)
//
//
//                    Button(action: {
//                        signInButtonTapped()
//                    }) {
//                        Text("Sign In")
//                            .foregroundColor(.white)
//                                .frame(width: 300, height: 50)
//                                .background{Color("PrimaryColor")}
//                                .cornerRadius(10)
//                    }
//                    .padding()
//
//                    if isSignedIn {
//                        HomeScreen()
////                        NavigationLink(destination: HomeView()) {
////                            Text("Go to Home")
////                        }
//                    }
//
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                        .font(.headline)
//                        .padding(.top)
//
//                    Spacer()
//                }
//                .padding()
//                .onAppear(perform: animate)
//            }
//        }
//    }
//
//    // Placeholder for the sign-in button action
//    private func signInButtonTapped() {
//        errorMessage = ""
//
//        Task {
//            do {
//                let token = try await performSignIn()
//                UserDefaults.standard.set(token, forKey: "token")
//                isSignedIn = true
//            } catch {
//                errorMessage = "Error: \(error)"
//            }
//        }
//    }
//
//
//    // Placeholder for the sign-in logic
//    private func performSignIn() async throws -> String {
//        let parameters = ["email": email, "password": password]
//        guard let url = URL(string: "http://127.0.0.1:8000/api/login") else {
//            throw URLError(.badURL)
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            let (data, _) = try await URLSession.shared.data(for: request)
//            let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
//            if let token = json["token"] as? String {
//                // Your further processing logic here
//                return token // Return the token if it's found
//            } else {
//                throw SignInError.invalidResponse
//            }
//        } catch {
//            // Handle any errors that occurred during the network request or response processing
//            throw error // Re-throw the error
//        }
//    }
//    }
//
//    // Placeholder for the animation function
//    private func animate() {
//        // Implement your view animations here
//    }
//
//
//enum SignInError: Error {
//    case invalidResponse
//}
//
//struct HomeView: View {
//    var body: some View {
////        HomeScreen()
//        Text("Welcome to the HomeView!")
//    }
//}
//
//struct SignInScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInScreen()
//    }
//}
//

import SwiftUI

struct SignInScreen: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var errorMessage = ""
//    @State private var isSignedIn = false
    @State private var isNavigatingToHome = false
    @StateObject var loginVM: SigninViewModel = SigninViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                Color("PrimaryColor").ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                VStack{
                    Spacer()
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    TextField("Email", text: $loginVM.email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    SecureField("Password", text: $loginVM.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    Button(action: {
                        loginVM.signInButtonTapped{ success in
                            if success {
                                // Handle successful save, e.g., show an alert
                                print("Data saved successfully")
                                isNavigatingToHome = true
                            } else {
                                // Handle save failure, e.g., show an alert
                                print("Data save failed")
                            }
                        }
                    }) {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background { Color("PrimaryColor") }
                            .cornerRadius(10)
                    }
                    .padding()

                    // Use NavigationLink to navigate to HomeScreen
                    NavigationLink(destination: HomeScreen(), isActive: $loginVM.isSignedIn) {
                        
                       
                    }
                    .navigationBarHidden(true)

                    Text(loginVM.errorMessage)
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding(.top)
                    Spacer()
                }
                .padding()
                .onAppear(perform: loginVM.animate)
            }.navigationBarHidden(true)
        }
    }

    // Placeholder for the sign-in button action
//    private func signInButtonTapped() {
//        errorMessage = ""
//
//        Task {
//            do {
//                let token = try await performSignIn()
//                UserDefaults.standard.set(token, forKey: "token")
//                isSignedIn = true // Activate the NavigationLink
//            } catch {
//                errorMessage = "Error: \(error)"
//            }
//
//        }
//    }

    // Placeholder for the sign-in logic
//    private func performSignIn() async throws -> String {
//        // Your sign-in logic here
//        // ...
//
//        // If successful, return the token
//        return "your_token_here"
//    }

    // Placeholder for the animation function
//    private func animate() {
//        // Implement your view animations here
//    }
}

//struct HomeView: View {
//    var body: some View {
//        Text("Welcome to the HomeScreen!")
//    }
//}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
