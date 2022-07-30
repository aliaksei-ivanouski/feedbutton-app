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
    
    init(token: Binding<String>) {
        self._token = token
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text(" new password ")
                    .font(.custom("KaushanScript-Regular", size: 40))
                    .foregroundColor(.white)
                    .frame(width: 320, height: 100)
                    .padding(.bottom, 25)
                    .alert(isPresented: .constant(!viewModel.errorMessage.isEmpty)) {
                        Alert(title: Text("Error!"), message: Text(viewModel.errorMessage), dismissButton: .destructive(Text("Cancel"), action: {
                            viewModel.errorMessage = ""
                        }))
                    }
                
                VStack(spacing: 20) {
                    CustomSecureField(text: $newPassword1, placeholder: Text("new password..."))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $newPassword2, placeholder: Text("confirm new password..."))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .padding(.horizontal, 32)
                }
                
                Button(action: {
                    viewModel.resetPassword(withToken: token, withNewPassword1: newPassword1, withNewPassword2: newPassword2)
                }, label: {
                    Text(" Confirm ")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(passwordEmpty ? .purple.opacity(0.2) : .purple)
                        .clipShape(Capsule())
                        .padding()
                })
                .disabled(passwordEmpty)
                
                Spacer()
                
                HStack {
                    Text("I remember my password.")
                        .font(.system(size: 14))
                    
                    NavigationLink(destination: {
                        LoginView().navigationBarHidden(true)
                    }, label: {
                        Text("Log In")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                    })
                }
                .foregroundColor(.white)
                .padding(.bottom, 16)
            }
            .padding(.top, 44)
        }
        .onReceive(viewModel.$didSendResetPasswordLink, perform: { _ in
            self.mode.wrappedValue.dismiss()
        })
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
