//
//  ForgotPasswordView.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 11/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text(" feed button ")
                    .font(.custom("KaushanScript-Regular", size: 40))
                    .foregroundColor(.white)
                    .frame(width: 320, height: 100)
                    .padding(.bottom, 25)
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("email..."), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                }, label: {
                    Text(" Reset password ")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(emailEmpty ? .purple.opacity(0.2) : .purple)
                        .clipShape(Capsule())
                        .padding()
                })
                .disabled(emailEmpty)
                
                Spacer()
                
                HStack {
                    Text("Already have an accont?")
                        .font(.system(size: 14))
                    
                    Button(
                        action: {
                            mode.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                        })
                }
                .foregroundColor(.white)
                .padding(.bottom, 16)
            }
            .padding(.top, -44)
        }
        .onReceive(viewModel.$didSendResetPasswordLink, perform: { _ in
            self.mode.wrappedValue.dismiss()
        })
    }
    
    var emailEmpty: Bool {
        return email.isEmpty
    }
}
