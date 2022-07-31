//
//  FeedButton.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 31/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    var width: CGFloat
    var height: CGFloat
    var view: Text
    
    var body: some View {
        ZStack {
            view
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

