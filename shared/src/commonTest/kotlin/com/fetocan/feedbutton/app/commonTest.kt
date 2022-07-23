package com.fetocan.feedbutton.app

import com.fetocan.feedbutton.app.user.UserService
import kotlin.test.Test
import kotlin.test.assertTrue

class CommonUserServiceTest {

    @Test
    fun testExample() {
        assertTrue(UserService().greeting().contains("Hello"), "Check 'Hello' is mentioned")
    }
}