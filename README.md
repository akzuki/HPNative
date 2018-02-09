# HPNative (DEMO)

Write once, reuse anywhere: Build iOS/MacOS/Android/Web/Desktop apps with Javascript.

### Ideas

- **Separation of concerns:** Business logic and separation logic should be completely separated from each other.
Business logic is written in Typescript then compiled into clean, simple Javascript allowing it to be reused across platforms. On the other hand, presentation logic is done natively in XCode, Android Studio etc which gives you the best UI performance on each platform.
Native code and Javascript code communicate back and forth via a bridge created using JavascriptCore (iOS) and AndroidJSCore (Android)
<img src="https://github.com/akzuki/HPNative/blob/master/Screenshots/HPNative%20-%20Page%201.jpeg">

- **Wait, is this the same as ReactNative?**: Yes and no. This project is inspired by ReactNative and <b>Model-View-Presenter (MVP)</b> architecture. You can think of this project as ReactNative without the React.Component (so only reducers, stores, actions etc).
<img src="https://github.com/akzuki/HPNative/blob/master/Screenshots/mvp.jpeg" width=80%>
Personally I think only the business logic should be reused, not the UI components since each platform has a different way of dealing with UI components, navigation etc. By writing business logic in Javascript and presentation logic in native code, it allows you to reuse the business code across platforms while keeping UI performance and navigation as best as it is in native apps. (Yeah I know you have to do a lot more than in react-native but way less than making an app on each platform)
</br>
Imagine one day your client wants to port an existing iOS app to MacOS/Android/Web or even desktop apps. All you need to do is create the presentation logic for that specific platform and connect it to shared business logic through a bridge. And you're ready to go. (It's not that easy as it sounds but you understand what I mean ;) )
</br>
- Finally, this is just a personal project. There are many problems that I haven't addressed here. And there's still lots of room for improvement too. Any comments/contributions are extremely appreciated. :]


## Demo
------
### Typescript
`bundle.ts` (Business logic)
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
```Swift (Bridge)
@objc protocol LoginView: JSExport {
    func onStartLoading()
    func onEndLoading()
    func onLoginSuccess()
    func onLoginFailure(_ message: String)
}
```

#### Screenshots
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
```Kotlin (Bridge)
interface LoginView {
    fun onStartLoading()
    fun onEndLoading()
    fun onLoginSuccess()
    fun onLoginFailure(message: String)
}
```

#### Screenshots
`Android`
</br>
![alt tag](https://github.com/akzuki/HPNative/blob/master/Screenshots/hpnative_android.gif)

### Web (coming soon)

### Desktop apps (Electron) (coming soon)
