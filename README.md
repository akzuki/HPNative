# HPNative (DEMO)

Write once, reuse anywhere: Build iOS/MacOS/Android/Web/Desktop apps with Javascript.

### Typescript
`bundle.ts`
```Typescript
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
```
### iOS/MacOS
Use `JavascriptCore`
```Swift
@objc protocol LoginView: JSExport {
    func onStartLoading()
    func onEndLoading()
    func onLoginSuccess()
    func onLoginFailure(_ message: String)
}
```

#### Screnshots
`iOS`
</br>
![alt tag](https://github.com/akzuki/HPNative/blob/master/Screenshots/hpnative_ios.gif)
</br>
`MacOS`
</br>
![alt tag](https://github.com/akzuki/HPNative/blob/master/Screenshots/hpnative_macos.gif)
</br>

### Android
Use [AndroidJSCore](https://github.com/ericwlange/AndroidJSCore)
```Kotlin
interface LoginView {
    fun onStartLoading()
    fun onEndLoading()
    fun onLoginSuccess()
    fun onLoginFailure(message: String)
}
```

#### Screeshots
`Android`
</br>
![alt tag](https://github.com/akzuki/HPNative/blob/master/Screenshots/hpnative_android.gif)

### Web (coming soon)

### Desktop apps (Electron) (coming soon)
