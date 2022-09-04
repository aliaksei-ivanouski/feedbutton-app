//
//  MainView.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 26/08/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var dragAmount = CGSize.zero
    @State private var isFeedViewOnFront = true
    
    var body: some View {
        if isFeedViewOnFront {
            ZStack {
                FeedsButtonView()
                    .opacity(isFeedViewOnFront ? 1 : 0)
                
                FeedView()
                    .opacity(isFeedViewOnFront ? 1 : 0)
                    .offset(dragAmount)
                    .modifier(DraggableModifier(action: {
                        isFeedViewOnFront.toggle()
                    }, direction: .horizontal, way: .right, length: UIScreen.main.bounds.size.width / 2))
            }
        } else {
            ZStack {
                FeedView()
                    .opacity(isFeedViewOnFront ? 0 : 1)

                FeedsButtonView()
                    .opacity(isFeedViewOnFront ? 0 : 1)
                    .offset(dragAmount)
                    .modifier(DraggableModifier(action: {
                        isFeedViewOnFront.toggle()
                    }, direction: .horizontal, way: .left, length: UIScreen.main.bounds.size.width / 2))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
