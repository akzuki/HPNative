//
//  Presenter.swift
//  HPNative
//
//  Created by Hai Phan on 06/02/2018.
//  Copyright © 2018 HaiPhan. All rights reserved.
//

import Foundation
import JavaScriptCore

class LoginPresenterImpl: LoginPresenter {
    weak var view: LoginView? {
        didSet {
            jsPresenter?.setValue(view, forProperty: "view")
        }
    }
    
    let jsPresenter: JSValue?
    
    init(jsPresenter: JSValue?) {
        self.jsPresenter = jsPresenter
    }
    
    func login(username: String, password: String) {
        _ = jsPresenter?.invokeMethod("login", withArguments: [username, password])
    }
}

protocol LoginPresenter {
    weak var view: LoginView? { get set }
    
    func login(username: String, password: String)
}

@objc protocol LoginView: JSExport {
    func onStartLoading()
    func onEndLoading()
    func onLoginSuccess()
    func onLoginFailure(_ message: String)
}
