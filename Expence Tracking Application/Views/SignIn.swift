//
//  SignIn.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-29.
//

import SwiftUI

struct SignIn: View {
    @StateObject var loginVM : SigninViewModel = SigninViewModel()
    
    var body: some View {
        ZStack{
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                Image("avatar")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
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
                Spacer()
                
                Text("Sign In")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background{Color("PrimaryColor")
                            .cornerRadius(50)
                    }
                
                Spacer()
            }.padding()
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
