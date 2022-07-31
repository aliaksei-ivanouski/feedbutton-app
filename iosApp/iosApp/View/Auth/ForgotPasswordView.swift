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
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack {
                Text(" reset password ")
                    .font(.custom("KaushanScript-Regular", size: 40))
                    .foregroundColor(.black)
                    .frame(width: 320, height: 100)
                    .padding(.bottom, 25)
                    .alert(isPresented: .constant(!viewModel.errorMessage.isEmpty)
                    ) {
                        Alert(title: Text("Error!"), message: Text(viewModel.errorMessage), dismissButton: .destructive(Text("Cancel"), action: {
                            viewModel.errorMessage = ""
                        }))
                    }
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("email..."), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.5)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 0.5)
                            )
                        .frame(width: 340, height: 50)
                        .padding(.bottom, 7)
                }
                
                Button(action: {
                    viewModel.forgotPassword(withEmail: email)
                }, label: {
                    CustomButton(width: 340, height: 50,
                                 view: Text(" Reset password ")
                        .font(.headline)
                        .foregroundColor(emailEmpty ? .gray : .black)
                    )
                    .padding()
                })
                .disabled(emailEmpty)
                
                Spacer()
                
                HStack {
                    Text("I remember my password.")
                        .font(.system(size: 14))
                    
                    Button(
                        action: {
                            mode.wrappedValue.dismiss()
                        }, label: {
                            Text("Log In")
                                .font(.system(size: 14, weight: .semibold))
                                .underline()
                        })
                }
                .foregroundColor(.gray)
                .padding(.bottom, 16)
            }
            .padding(.top, 44)
        }
        .onReceive(viewModel.$didSendForgotPasswordLink, perform: { _ in
            self.mode.wrappedValue.dismiss()
        })
    }
    
    var emailEmpty: Bool {
        return email.isEmpty
    }
}
