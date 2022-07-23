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
    
    func logout() {
        self.userSession = nil
//        try? call_logout_from_kotlin
    }
    
}
