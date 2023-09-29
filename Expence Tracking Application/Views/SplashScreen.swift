//
//  SplashScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        VStack{
            VStack{
                Image("expence")
                    .font(.system(size: 80))
                Text("Expence Tracking Application")
                    .font(Font.custom("Baskerville-Bold",size: 26))
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryColor"))
                    .padding(.vertical)
                
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.2)){
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
