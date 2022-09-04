//
//  NewPasswordView.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 30/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct NewPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var token: String
    @State private var newPassword1 = ""
    @State private var newPassword2 = ""
    @State private var showAlert = false
    @State private var eyeOpened = false
    
    init(token: Binding<String>) {
        self._token = token
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack {
                Text(" new password ")
                    .font(.custom("KaushanScript-Regular", size: 40))
                    .foregroundColor(.black)
                    .frame(width: 320, height: 100)
                    .padding(.bottom, 25)
                    .alert(isPresented: .constant(!viewModel.errorMessage.isEmpty)) {
                        Alert(title: Text("Error!"), message: Text(viewModel.errorMessage), dismissButton: .destructive(Text("Cancel"), action: {
                            viewModel.errorMessage = ""
                        }))
                    }
                
                VStack(spacing: 20) {
                    CustomSecureField(eyeOpened: $eyeOpened, text: $newPassword1, placeholder: Text("new password..."))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.5)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 0.5)
                            )
                        .frame(width: 340, height: 50)
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(eyeOpened: $eyeOpened, text: $newPassword2, placeholder: Text("confirm new password..."))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.5)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 0.5)
                            )
                        .frame(width: 340, height: 50)
                        .padding(.horizontal, 32)
                }
                
                Button(action: {
                    viewModel.resetPassword(withToken: token, withNewPassword1: newPassword1, withNewPassword2: newPassword2)
                }, label: {
                    CustomButton(title: " Confirm ",
                                 width: 340, height: 50,
                                 font: .headline,
                                 color: passwordEmpty ? .gray : .black)
                    .padding()
                })
                .disabled(passwordEmpty)
                
                Spacer()
                
                HStack {
                    Text("I remember my password.")
                        .font(.system(size: 14))
                    
                    Button(
                        action: {
                            viewModel.toLogin = true
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
    }
    
    var passwordEmpty: Bool {
        return newPassword1.isEmpty || newPassword2.isEmpty
    }
    
    var passwordsNotEqual: Bool {
        return newPassword1 != newPassword2
    }
}

//struct NewPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPasswordView(token: .constant(""))
//    }
//}
