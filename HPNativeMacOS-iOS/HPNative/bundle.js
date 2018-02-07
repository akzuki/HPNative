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
