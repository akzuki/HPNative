//
//  ViewController.swift
//  HPNative
//
//  Created by Hai Phan on 06/02/2018.
//  Copyright © 2018 HaiPhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginPresenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPresenter = LoginPresenterImpl(jsPresenter: JSCore.initJSLoginPresenter())
        loginPresenter.view = self
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        loginPresenter.login(username: username, password: password)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: LoginView {
    func onStartLoading() {
        logTextView.text = logTextView.text + "\n" + "onStartLoading"
        print("onStartLoading")
    }
    
    func onEndLoading() {
        logTextView.text = logTextView.text + "\n" + "onEndLoading"
        print("onEndLoading")
    }
    
    func onLoginSuccess() {
        let alert = UIAlertController(title: "Login success", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        print("onLoginSuccess")
    }
    
    func onLoginFailure(_ message: String) {
        let alert = UIAlertController(title: "Login failed", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        print("onLoginFailure")
    }
}
