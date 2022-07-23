package com.fetocan.feedbutton.app.user

import com.fetocan.feedbutton.app.authentication.AuthenticationHttpClient
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class User(
    @SerialName("id")
    val id: String? = null,
    @SerialName("role")
    val role: String? = null,
    @SerialName("name")
    val name: String? = null,
    @SerialName("last_name")
    val lastName: String? = null,
    @SerialName("age")
    val age: Int? = null,
    @SerialName("status")
    val status: Status? = null,
    @SerialName("last_used_ip")
    var lastUsedIp: String? = null,
    @SerialName("access_token")
    val accessToken: String? = null,
    @SerialName("refresh_token")
    val refreshToken: String? = null
) {
    constructor(response: AuthenticationHttpClient.ManagerAuthResponse): this(
        response.manager.id,
        response.manager.role?.name,
        response.manager.name,
        response.manager.lastName,
        response.manager.age,
        response.manager.status,
        response.manager.lastUsedIp,
        response.accessToken,
        "refresh_token",
    )

    enum class Status {
        PENDING,
        ACTIVE,
        INACTIVE
    }
}
