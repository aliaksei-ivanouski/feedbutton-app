//
//  AuthViewModel.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 13/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    @Published var errorMessage: String = ""
    @Published var toLogin = false
    @Published var didSendForgotPasswordLink = false
    @Published var didSendResetPasswordLink = false
    let userService = UserService()
    
    static let shared = AuthViewModel()
    
    func login(withEmail email: String, password: String) {
        userService.login(email: email, password: password) { result, error in
            if let result = result {
                self.userSession = result
            } else if let error = error {
                self.errorMessage = error.localizedDescription
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func forgotPassword(withEmail email: String) {
        userService.forgotPassword(email: email) { _, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print("Error: \(error.localizedDescription)")
                return
            }
            self.didSendForgotPasswordLink = true
        }
    }
    
    func resetPassword(withToken token: String, withNewPassword1 password1: String, withNewPassword2 password2: String) {
        userService.resetPassword(token: token, newPassword1: password1, newPassword2: password2) { _, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print("Error: \(error.localizedDescription)")
                return
            }
            self.didSendResetPasswordLink = true
            self.toLogin.toggle()
        }
    }
    
    func logout() {
        self.userSession = nil
    }
    
}
