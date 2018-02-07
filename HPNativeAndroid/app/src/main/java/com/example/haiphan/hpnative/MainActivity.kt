package com.example.haiphan.hpnative

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*
import org.liquidplayer.javascript.JSContext
import org.liquidplayer.javascript.JSObject

class MainActivity : AppCompatActivity(), LoginView {
    private var loginView: LoginViewImpl? = null
    private val context = JSContext()
    private var presenter: JSObject? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val js = """
            var LoginPresenterImpl = /** @class */ (function () {
                                        function LoginPresenterImpl() {
                                        }
                                        LoginPresenterImpl.prototype.login = function (username, password) {
                                        this.view.onStartLoading();
                                        if ((username == 'admin') && (password == 'admin')) {
                                        this.view.onEndLoading();
                                        this.view.onLoginSuccess();
                                        }
                                        else {
                                        this.view.onEndLoading();
                                        this.view.onLoginFailure('Invalid username & password');
                                        }
                                        };
                                        return LoginPresenterImpl;
                                        }());
            """


        context.evaluateScript(js)
        context.setExceptionHandler {
            println("Exception ${it.error.message()}")
        }
        loginView = LoginViewImpl(context, this)

        presenter = context.property("LoginPresenterImpl").toObject().toFunction().newInstance(null)

        context.property("view", loginView)

        loginButton.setOnClickListener {
            val username = usernameTextField.text.toString()
            val password = passwordTextField.text.toString()
            presenter?.property("login")?.toFunction()?.call(null, username, password)
        }
    }

    override fun onStartLoading() {
        logTextView?.append("\nonStartLoading")
        println("onStartLoading")
    }

    override fun onEndLoading() {
        logTextView?.append("\nonEndLoading")
        println("onEndLoading")
    }

    override fun onLoginSuccess() {
        Toast.makeText(this, "Login success", Toast.LENGTH_SHORT).show()
        println("onLoginSuccess")
    }

    override fun onLoginFailure(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
        println("onLoginFailure")
    }
}