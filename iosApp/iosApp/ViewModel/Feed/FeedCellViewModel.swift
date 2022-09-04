//
//  FeedCellViewModel.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 26/08/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likesString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
//    var timestampString: String {
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
//        formatter.maximumUnitCount = 1
//        formatter.unitsStyle = .abbreviated
//        return formatter.string(from: post.timestamp, to: Date()) ?? ""
//    }
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    func like() {
        guard let postId = post.id else { return }
        guard let id = AuthViewModel.shared.userSession?.id else { return }
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let postId = post.id else { return }
        guard let id = AuthViewModel.shared.userSession?.id else { return }
    }
    
    func checkIfUserLikedPost() {
        guard let postId = post.id else { return }
        guard let id = AuthViewModel.shared.userSession?.id else { return }
    }
}
