package com.fetocan.feedbutton.app.authentication

import com.fetocan.feedbutton.app.constants.ConfigConstants.BACKEND_HOST
import com.fetocan.feedbutton.app.user.User
import io.ktor.client.HttpClient
import io.ktor.client.request.post
import io.ktor.client.request.setBody
import io.ktor.client.request.url
import io.ktor.client.statement.bodyAsText
import io.ktor.http.ContentType
import io.ktor.http.HttpStatusCode
import io.ktor.http.contentType
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlin.coroutines.cancellation.CancellationException

object AuthenticationHttpClient {

    private val client = HttpClient()

    private val json = Json {
        isLenient = true
        ignoreUnknownKeys = true
    }

    @Throws(CancellationException::class, IllegalArgumentException::class)
    suspend fun login(
        email: String,
        password: String
    ): ManagerAuthResponse = withContext(Dispatchers.Main) {
        val response = client.post {
            url("$BACKEND_HOST/api/v1/auth/manager")
            contentType(ContentType.Application.Json)
            setBody(
                """
                {
                    "email": "$email",
                    "password": "$password"
                }
            """.trimIndent()
            )
        }
        if (response.status.value > 200) {
            throw IllegalArgumentException(
                "Login failure. Please check your email or/and password."
            )
        }
        json.decodeFromString(response.bodyAsText())
    }

    @Throws(CancellationException::class, IllegalArgumentException::class)
    suspend fun resetPassword(
        email: String
    ): HttpStatusCode = withContext(Dispatchers.Main) {
        val response = client.post {
            url("$BACKEND_HOST/api/v1/managers/forgot-password")
            contentType(ContentType.Application.Json)
            setBody(
                """
                {
                    "email": "$email"
                }
            """.trimIndent()
            )
        }
        if (response.status.value > 200) {
            throw IllegalArgumentException(
                "Reset password failure. Please check your email."
            )
        }
        response.status
    }

    @Serializable
    data class ManagerAuthResponse(
        val manager: Manager,
        val customer: TempCustomerResponse,
        val accessToken: String
    )

    @Serializable
    data class TempCustomerResponse(
        val id: String,
        val email: String,
        val name: String,
        val photoUrl: String?,
        val venueId: Long?,
        val accessScopes: Array<String>?
    )

    @Serializable
    data class Manager(
        val id: String? = null,
        val email: String? = null,
        var role: ManagerRole? = null,
        var photoUrl: String? = null,
        val name: String? = null,
        val lastName: String? = null,
        val status: User.Status? = null,
        val age: Int? = null,
        var lastUsedIp: String? = null,
        var details: JsonElement? = null
    )

    enum class ManagerRole {
        ADMIN,
        VENUE_MANAGER,
        WAITER
    }
}