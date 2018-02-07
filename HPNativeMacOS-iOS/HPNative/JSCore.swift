//
//  JSCore.swift
//  HPNative
//
//  Created by Hai Phan on 07/02/2018.
//  Copyright © 2018 HaiPhan. All rights reserved.
//

import Foundation
import JavaScriptCore

struct JSCore {
    static let context: JSContext? = {
        let context = JSContext()
        
        guard let
            testJSPath = Bundle.main.path(forResource: "bundle", ofType: "js") else {
                print("Unable to read resource files.")
                return nil
        }
        
        do {
            let test = try String(contentsOfFile: testJSPath, encoding: String.Encoding.utf8)
            _ = context?.evaluateScript(test)
        } catch (let error) {
            print("Error while processing script file: \(error)")
        }
        
        context?.exceptionHandler = { context, exception in
            print("JS Error: \(exception?.description ?? "unknown error")")
        }

        
        return context
    }()
    
    static func initJSLoginPresenter() -> JSValue? {
        return JSCore.context?.objectForKeyedSubscript("LoginPresenterImpl").construct(withArguments: nil)
    }
}
