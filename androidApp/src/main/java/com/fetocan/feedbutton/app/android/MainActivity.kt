package com.fetocan.feedbutton.app.android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.fetocan.feedbutton.app.user.UserService
import android.widget.TextView
import kotlinx.coroutines.withContext

var token: String = ""

suspend fun setToken() {
    val user = UserService().login(
        email = "some@email.com",
        password = "password"
    )
    token = user.accessToken ?: ""
}

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val tv: TextView = findViewById(R.id.text_view)
        tv.text = token
    }
}
