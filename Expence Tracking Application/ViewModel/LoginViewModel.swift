//
//  LoginViewModel.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-29.
//

import Foundation
import SwiftUI

class LoginViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
    
    @Published var showSignInView : Bool = false
   
    
}
