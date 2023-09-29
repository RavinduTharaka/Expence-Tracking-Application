//
//  SignupViewModel.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import Foundation
import SwiftUI

class SignupViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
    
    @Published var showSignInView : Bool = false
   
    
}


