package com.jetbrains.splashscreendemo

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform