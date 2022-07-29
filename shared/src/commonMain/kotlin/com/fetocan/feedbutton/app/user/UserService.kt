package com.fetocan.feedbutton.app.user

import com.fetocan.feedbutton.app.authentication.AuthenticationHttpClient
import io.ktor.http.HttpStatusCode
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlin.coroutines.cancellation.CancellationException

class UserService {

    @Throws(CancellationException::class, IllegalArgumentException::class)
    suspend fun login(
        email: String?,
        password: String?
    ): User = withContext(Dispatchers.Main) {
        email?.takeIf {
            it.isNotEmpty()
        } ?: throw IllegalArgumentException("Email cannot be empty")
        password?.takeIf {
            it.isNotEmpty()
        } ?: throw IllegalArgumentException("Password cannot be empty")
        val response = AuthenticationHttpClient.login(email, password)

        User(response)
    }

    @Throws(CancellationException::class, IllegalArgumentException::class)
    suspend fun resetPassword(
        email: String?
    ) {
        withContext(Dispatchers.Main) {
            email?.takeIf {
                it.isNotEmpty()
            } ?: throw IllegalArgumentException("Email cannot be empty")
            AuthenticationHttpClient.resetPassword(email)
                .takeIf { it == HttpStatusCode.OK }
                ?: throw IllegalArgumentException("Error occurred during reset password")
        }
    }
}