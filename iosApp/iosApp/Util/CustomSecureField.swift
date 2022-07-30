//
//  CustomSecureField.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 11/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    @Binding private var eyeOpened: Bool
    
    init(eyeOpened: Binding<Bool>, text: Binding<String>, placeholder: Text) {
        self._eyeOpened = eyeOpened
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                if eyeOpened {
                    TextField("", text: $text)
                } else {
                    SecureField("", text: $text)
                }
                
                Spacer()
                
                Button(action: {
                    eyeOpened.toggle()
                }, label: {
                    Image(systemName: eyeOpened ? "eye" : "eye.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                })
            }
        }
    }
}
