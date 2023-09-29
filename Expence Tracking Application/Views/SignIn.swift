//
//  SignIn.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-29.
//

import SwiftUI

struct SignIn: View {
    @StateObject var loginVM : SigninViewModel = SigninViewModel()
    
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var ShowingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("PrimaryColor").ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                VStack{
                
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    //                Image("avatar")
                    //                    .resizable()
                    //                    .scaledToFit()
                    TextField("Email", text: $loginVM.email)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width:CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $loginVM.password)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width:CGFloat(wrongPassword))
                    
                    Button("Login"){
//                        authenticateUser(username: $loginVM.email, password: $loginVM.password)
                        
                    }.foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background{Color("PrimaryColor")}
                        .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in @\(loginVM.email)"), isActive: $ShowingLoginScreen){
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    func authenticateUser(username: String, password: String){
        if username.lowercased()=="ravindu"{
            wrongPassword = 0
            if password.lowercased()=="abc123"{
                wrongPassword = 0
                ShowingLoginScreen = true
            }
            
            else{
                wrongPassword = 2
            }
        }else{
            wrongUsername = 2
        }
    }
    
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
