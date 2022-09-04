//
//  FeedViewModel.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 26/08/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts.append(Post(id: "1111-1111-1111-1111", ownerUid: "2222-2222-2222-2222", ownerUsername: "Peter", ownerImageUrl: "https://www.nicepng.com/png/full/107-1070892_avatar-png-avatar-2.png", caption: "Good food", likes: 12, imageUrl: "https://media.istockphoto.com/photos/cozy-restaurant-for-gathering-with-friends-picture-id1159992039?k=20&m=1159992039&s=612x612&w=0&h=t2lqevaWYLXvcjDeKzbHvIRF6GE3gxiqO6AIezr3Mws=", timestamp: "2 days", didLike: true))
        self.posts.append(Post(id: "1111-1111-1111-1111", ownerUid: "2222-2222-2222-2222", ownerUsername: "Viktor", ownerImageUrl: "https://img.freepik.com/free-photo/closeup-shot-lion-s-face-isolated-dark_181624-35975.jpg?w=2000&t=st=1661513667~exp=1661514267~hmac=ec246cf14412fef7545f3d75a92bfe0240b2a5f20c47d8f58ff2f894fbdd5924", caption: "Very cosy and beautiful place", likes: 0, imageUrl: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60", timestamp: "2 days", didLike: false))
        self.posts.append(Post(id: "1111-1111-1111-1111", ownerUid: "2222-2222-2222-2222", ownerUsername: "Peter", ownerImageUrl: "https://comicvine.gamespot.com/a/uploads/scale_medium/12/124259/7538232-three-jokers-1-cvr-fnl-1583776056592.jpg", caption: "Lovely place, highly recommend to visit", likes: 1, imageUrl: "https://images.unsplash.com/photo-1592861956120-e524fc739696?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", timestamp: "2 days", didLike: true))
        self.posts.append(Post(id: "1111-1111-1111-1111", ownerUid: "2222-2222-2222-2222", ownerUsername: "Peter", ownerImageUrl: "https://comicvine.gamespot.com/a/uploads/scale_medium/12/124259/7538232-three-jokers-1-cvr-fnl-1583776056592.jpg", caption: "Very good service", likes: 12, imageUrl: "https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60", timestamp: "2 days", didLike: true))
    }
}
