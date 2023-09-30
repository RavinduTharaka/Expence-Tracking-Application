//
//  SignUp.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-29.
//

//import SwiftUI
//
//struct SignUp: View {
//    @StateObject var loginVM : SignupViewModel = SignupViewModel()
//
//    var body: some View {
//
//        ZStack{
//            Color(.white)
//                .edgesIgnoringSafeArea(.all)
//            VStack{
//                Spacer()
//
//                VStack{
//                    Text("Sign Up")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .padding(.bottom, 30)
//
//                    HStack{
//                        Image(systemName: "apple.logo")
//                        Spacer()
//                        Text("Sign in with Apple")
//                            .font(.title3)
//                        Spacer()
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color .white)
//                    .cornerRadius(50.0)
//                    .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
//
//                    HStack{
//                        Image(systemName: "apple.logo")
//                        Spacer()
//                        Text("Sign in with Google")
//                            .foregroundColor(Color("PrimaryColor"))
//                            .font(.title3)
//                        Spacer()
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color .white)
//                    .cornerRadius(50.0)
//                    .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
//
//                    Text("or create new account")
//                        .foregroundColor(Color.black.opacity(0.4))
//
//
//                    VStack{
//                        RoundedRectangle(cornerRadius: 10)
//                            .foregroundColor(.white)
//                            .frame(height: 50)
//                            .overlay {
//                                TextField("Email", text: $loginVM.email)
//                                    .font(.title3)
//                                    .padding(.leading, 10)
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.white)
//                                    .cornerRadius(50.0)
//                                    .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
//                                    .padding(.vertical)
//                            }
//                    }
//
//                    VStack{
//                        RoundedRectangle(cornerRadius: 10)
//                            .foregroundColor(.white)
//                            .frame(height: 50)
//                            .overlay {
//                                TextField("Password", text: $loginVM.password)
//                                    .font(.title3)
//                                    .padding(.leading, 10)
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.white)
//                                    .cornerRadius(50.0)
//                                    .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
//                                    .padding(.vertical)
//                            }
//                    }
//
//                    VStack{
//                        RoundedRectangle(cornerRadius: 10)
//                            .foregroundColor(.white)
//                            .frame(height: 50)
//                            .overlay {
//                                TextField("Confirm Password", text: $loginVM.confirmPassword)
//                                    .font(.title3)
//                                    .padding(.leading, 10)
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.white)
//                                    .cornerRadius(50.0)
//                                    .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
//                                    .padding(.vertical)
//                            }
//                    }
//
//                    Text("Sign Up")
//                        .font(.title3)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background{Color("PrimaryColor")
//                                .cornerRadius(50)
//                        }
//
//
//                }.padding()
//
//                Spacer()
//                Divider()
//                Spacer()
//                Text("You are completely safe.")
//                Text("Read our Terms & Conditions.")
//                    .foregroundColor(Color("PrimaryColor"))
//                Spacer()
//            }
//
//
//        }
//    }
//}
//
//func registerTapped() {
//    let parameters = ["name": username, "email": email, "password": password, "confirmpassword": confirmPassword]
//
//    guard let url = URL(string: "http://127.0.0.1:8000/api/register") else { return }
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    let session = URLSession.shared
//    session.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Error: \(error)")
//            return
//        }
//        guard let data = data else {
//            print("No data")
//            return
//        }
//        do {
//            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//               let token = json["token"] as? String {
//                UserDefaults.standard.set(token, forKey: "token")
//                isRegistered = true
//            }
//        } catch let error {
//            print("Error serializing JSON: \(error)")
//        }
//    }.resume()
//}
//}
//
//
//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp()
//    }
//}


import SwiftUI

class Signup: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
}

struct SignUp: View {
    @StateObject var loginVM: SignupViewModel = SignupViewModel()

    @State private var isRegistered = false

    var body: some View {

        ZStack{
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
        
                        VStack{
                            Text("Sign Up")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom, 30)
        
                            HStack{
                                Image(systemName: "apple.logo")
                                Spacer()
                                Text("Sign in with Apple")
                                    .font(.title3)
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color .white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
        
                            HStack{
                                Image(systemName: "apple.logo")
                                Spacer()
                                Text("Sign in with Google")
                                    .foregroundColor(Color("PrimaryColor"))
                                    .font(.title3)
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color .white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
        
                            Text("or create new account")
                                .foregroundColor(Color.black.opacity(0.4))
                            
                            VStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .overlay {
                                        TextField("Name", text: $loginVM.name)
                                            .font(.title3)
                                            .padding(.leading, 10)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.white)
                                            .cornerRadius(50.0)
                                            .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
                                            .padding(.vertical)
                                    }
                            }
        
        
                            VStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .overlay {
                                        TextField("Email", text: $loginVM.email)
                                            .font(.title3)
                                            .padding(.leading, 10)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.white)
                                            .cornerRadius(50.0)
                                            .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
                                            .padding(.vertical)
                                    }
                            }
        
                            VStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .overlay {
                                        SecureField("Password", text: $loginVM.password)
                                            .font(.title3)
                                            .padding(.leading, 10)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.white)
                                            .cornerRadius(50.0)
                                            .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
                                            .padding(.vertical)
                                    }
                            }
        
                            VStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .overlay {
                                        SecureField("Confirm Password", text: $loginVM.confirmPassword)
                                            .font(.title3)
                                            .padding(.leading, 10)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.white)
                                            .cornerRadius(50.0)
                                            .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
                                            .padding(.vertical)
                                        
                                    }
                            }
        
                            Button(action: {
                                self.registerTapped()
                            }) {
                                Text("Sign Up")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        Color("PrimaryColor")
                                            .cornerRadius(50)
                                    )
                            }
        
        
                        }.padding()
        
                        Spacer()
                        Divider()
                        Spacer()
                        Text("You are completely safe.")
                        Text("Read our Terms & Conditions.")
                            .foregroundColor(Color("PrimaryColor"))
                        Spacer()
                    }
        
        
                }
            }

    func registerTapped() {
        let parameters = [
            "name": loginVM.name,
            "email": loginVM.email,
            "password": loginVM.password,
            "confirmPassword": loginVM.confirmPassword
        ]

        guard let url = URL(string: "http://127.0.0.1:8000/api/register") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let token = json["token"] as? String {
                    UserDefaults.standard.set(token, forKey: "token")
                    DispatchQueue.main.async {
                        isRegistered = true // Update the state
                    }
                }
            } catch let error {
                print("Error serializing JSON: \(error)")
            }
        }.resume()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
