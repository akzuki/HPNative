//
//  ViewController.swift
//  HPNativeMac
//
//  Created by Hai Phan on 07/02/2018.
//  Copyright © 2018 HaiPhan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var logTextView: NSTextView!
    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSTextField!
    
    var loginPresenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPresenter = LoginPresenterImpl(jsPresenter: JSCore.initJSLoginPresenter())
        loginPresenter.view = self
    }
    
    @IBAction func didTapLoginButton(_ sender: NSButton) {
        let username = usernameTextField.stringValue
        let password = passwordTextField.stringValue
        loginPresenter.login(username: username, password: password)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: LoginView {
    func onStartLoading() {
        logTextView.textStorage?.mutableString.append("\n" + "onStartLoading")
        print("onStartLoading")
    }
    
    func onEndLoading() {
        logTextView.textStorage?.mutableString.append("\n" + "onEndLoading")
        print("onEndLoading")
    }
    
    func onLoginSuccess() {
        let alert = NSAlert()
        alert.messageText = "Login success"
        alert.addButton(withTitle: "OK")
        alert.alertStyle = .informational
        
        alert.runModal()
        print("onLoginSuccess")
    }
    
    func onLoginFailure(_ message: String) {
        let alert = NSAlert()
        alert.messageText = "Login failed"
        alert.informativeText = message
        alert.addButton(withTitle: "OK")
        alert.alertStyle = .informational
        
        alert.runModal()
        print("onLoginFailure")
    }
}

