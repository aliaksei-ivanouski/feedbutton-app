package com.fetocan.feedbutton.app

import com.fetocan.feedbutton.app.user.UserService
import kotlin.test.Test
import kotlin.test.assertTrue

class IosGreetingTest {

    @Test
    fun testExample() {
        assertTrue(UserService().greeting().contains("iOS"), "Check iOS is mentioned")
    }
}