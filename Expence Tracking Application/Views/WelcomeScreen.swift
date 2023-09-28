//
//  WelcomeScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-29.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        ZStack{
            Color(.white).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Image("Home1")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("Get Started")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background{Color("PrimaryColor")
                            .cornerRadius(50)
                    }
                
                NavigationLink(
                    destination: SignIn().navigationBarHidden(true),
                    label: {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryColor"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color .white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08),radius: 60, x:0.0, y:16)
                        .padding(.vertical)})
                .navigationBarHidden(true)
                
                HStack{
                    Text("New around here? ")
                    NavigationLink(
                        destination: SignUp().navigationBarHidden(true),
                        label: {
                    Text("Sign Up")
                        .foregroundColor(Color("PrimaryColor"))
                        })
                .navigationBarHidden(true)
                }
                
            }.padding()
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
