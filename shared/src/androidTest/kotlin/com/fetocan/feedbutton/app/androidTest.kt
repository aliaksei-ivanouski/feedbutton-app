package com.fetocan.feedbutton.app

import com.fetocan.feedbutton.app.user.UserService
import org.junit.Assert.assertTrue
import org.junit.Test

class AndroidUserServiceTest {

    @Test
    fun testExample() {
        assertTrue("Check Android is mentioned", UserService().greeting().contains("Android"))
    }
}