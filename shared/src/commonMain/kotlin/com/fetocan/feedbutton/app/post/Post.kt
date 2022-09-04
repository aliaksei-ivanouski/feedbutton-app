package com.fetocan.feedbutton.app.post

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Post(
    @SerialName("id")
    var id: String? = null,
    @SerialName("owner_uid")
    val ownerUid: String? = null,
    @SerialName("owner_username")
    val ownerUsername: String? = null,
    @SerialName("owner_image_url")
    val ownerImageUrl: String? = null,
    @SerialName("caption")
    val caption: String? = null,
    @SerialName("likes")
    var likes: Int,
    @SerialName("image_url")
    val imageUrl: String? = null,
    @SerialName("timestamp")
    val timestamp: String? = null,
    @SerialName("did_like")
    var didLike: Boolean = false
)
