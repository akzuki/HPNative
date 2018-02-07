interface LoginView { 
    onStartLoading(): void;
    onEndLoading(): void;
    onLoginSuccess(): void;
    onLoginFailure(message: string): void
}

interface LoginPresenter { 
    view: LoginView;
    login(username: string, password: string): void;
}

class LoginPresenterImpl implements LoginPresenter { 
    view: LoginView;

    login(username: string, password: string) { 
        this.view.onStartLoading();
        if ((username == 'admin') && (password == 'admin')) { 
            this.view.onEndLoading();
            this.view.onLoginSuccess();
        } else { 
            this.view.onEndLoading();
            this.view.onLoginFailure('Invalid username & password');
        }
    }
}