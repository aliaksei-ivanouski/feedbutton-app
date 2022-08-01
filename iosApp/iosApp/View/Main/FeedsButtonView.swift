//
//  FeedsButtonView.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 31/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct FeedsButtonView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var postImage: Image?
    @State private var selectedImage: UIImage?
    @State var imagePickerPresented = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack {
                Text(" welcome to ")
                    .font(.custom("KaushanScript-Regular", size: 50))
                    .foregroundColor(.black)
                    .frame(width: 320, height: 100)
                    .padding(.bottom, 25)
                
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    CustomButton(width: 340, height: 340,
                               view: Text(" feed button ")
                        .font(.custom("KaushanScript-Regular", size: 40))
                        .foregroundColor(.black)
                    )
                })
                .padding(.bottom, 44)
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage, sourceType: .camera)
                })
                
                Spacer()
                
                HStack {
                    Text("Already have an accont?")
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
}

extension FeedsButtonView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
