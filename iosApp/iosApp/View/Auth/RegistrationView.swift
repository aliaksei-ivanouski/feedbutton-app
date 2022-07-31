//
//  SignupView.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 11/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                HStack {
                    Text("Already have an accont?")
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
            .padding(.top, -44)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
