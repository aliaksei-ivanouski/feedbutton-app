package com.fetocan.feedbutton.app.android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.fetocan.feedbutton.app.user.UserService
import android.widget.TextView

fun greet(): String {
    return UserService().greeting()
}

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val tv: TextView = findViewById(R.id.text_view)
        tv.text = greet()
    }
}
