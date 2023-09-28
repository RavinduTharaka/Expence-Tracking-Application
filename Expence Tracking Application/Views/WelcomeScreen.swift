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
                Image("Home1")
                    .resizable()
                    .scaledToFit()
                Text("Get Started")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background{Color("PrimaryColor")
                            .cornerRadius(50)
                    }
                Text("Sign In")
                    .font(.title3)
                    .fontWeight(.bold)
            }.padding()
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
