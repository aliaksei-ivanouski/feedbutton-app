//
//  FeedButton.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 31/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    private var title: String
    private var systemImage: String = ""
    private var width: CGFloat
    private var height: CGFloat
    private var font: Font
    private var color: Color
    
    init(title: String, width: CGFloat, height: CGFloat, font: Font, color: Color) {
        self.title = title
        self.width = width
        self.height = height
        self.font = font
        self.color = color
    }
    
    init(title: String, systemImage: String, width: CGFloat, height: CGFloat, font: Font, color: Color) {
        self.title = title
        self.systemImage = systemImage
        self.width = width
        self.height = height
        self.font = font
        self.color = color
    }
    
    var body: some View {
        ZStack {
            if systemImage.isEmpty {
                Text(self.title)
                    .font(font)
                    .foregroundColor(color)
            } else {
                Label(self.title, systemImage: self.systemImage)
                    .font(font)
                    .foregroundColor(color)
            }
        }
        .frame(width: width, height: height)
        .background(
            ZStack {
                Capsule()
                    .fill(Color("Background"))
                    .frame(width: width, height: height)
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8 )
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8 )
            }
        )
    }
}

