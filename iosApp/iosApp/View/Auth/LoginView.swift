//
//  LoginView.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 11/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var eyeOpened = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(Color("Background"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Text(" login ")
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
                            .padding(.horizontal, 32)
                        
                        CustomSecureField(eyeOpened: $eyeOpened, text: $password, placeholder: Text("password..."))
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
                    
                    HStack {
                        Button(action: {
                            viewModel.toLogin = false
                        }, label: {
                            Text("To button")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.top)
                        })
                        
                        Spacer()
                        
                        NavigationLink {
                            ForgotPasswordView(email: $email)
                                .navigationBarHidden(true)
                        } label: {
                            Text("Forgot password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.top)
                        }
                    }
                    .frame(width: 340, height: 30)
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        CustomButton(title: " login ",
                                     width: 340, height: 50,
                                     font: .headline,
                                     color: credentialsEmpty ? .gray : .black)
                        .padding()
                    })
                    .disabled(credentialsEmpty)
                    
                    Spacer()
                    
                    HStack {
                        Text("Do not have an account?")
                            .font(.system(size: 14))
                        
                        NavigationLink(
                            destination: RegistrationView()
                                .navigationBarHidden(true),
                            label: {
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                                    .underline()
                            })
                    }
                    .foregroundColor(.gray)
                    .padding(.bottom, 16)
                }
                .padding(.top, -44)
            }
        }
    }
    
    var credentialsEmpty: Bool {
        return email.isEmpty || password.isEmpty
    }
}
