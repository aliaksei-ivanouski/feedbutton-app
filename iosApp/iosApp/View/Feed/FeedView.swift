//
//  FeedView.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 15/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts, id: \.self) { post in
                        FeedCell(viewModel: FeedCellViewModel(post: post))
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
