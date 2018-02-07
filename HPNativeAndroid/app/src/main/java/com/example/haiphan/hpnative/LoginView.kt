package com.example.haiphan.hpnative

import android.widget.Button
import android.widget.TextView
import org.liquidplayer.javascript.JSContext
import org.liquidplayer.javascript.JSObject

/**
 * Created by haiphan on 07/02/2018.
 */

interface LoginView {
    fun onStartLoading()
    fun onEndLoading()
    fun onLoginSuccess()
    fun onLoginFailure(message: String)
}

class LoginViewImpl(ctx: JSContext, var view: LoginView? = null): JSObject(ctx), LoginView {
    @jsexport
    override fun onStartLoading() {
        view?.onStartLoading()
    }
    @jsexport
    override fun onEndLoading() {
        view?.onEndLoading()
    }
    @jsexport
    override fun onLoginSuccess() {
        view?.onLoginSuccess()
    }
    @jsexport
    override fun onLoginFailure(message: String) {
        view?.onLoginFailure(message)
    }
}