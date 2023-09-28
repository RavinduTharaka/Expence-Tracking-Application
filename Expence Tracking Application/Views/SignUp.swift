//
//  SignUp.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-29.
//

import SwiftUI

struct SignUp: View {
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    
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
                                TextField("Password", text: $loginVM.password)
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
                                TextField("Confirm Password", text: $loginVM.confirmPassword)
                                    .font(.title3)
                                    .padding(.leading, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(50.0)
                                    .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
                                    .padding(.vertical)
                            }
                    }
                    
                    Text("Sign Up")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background{Color("PrimaryColor")
                                .cornerRadius(50)
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
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
