//
//  LoginManager.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 17/5/2565 BE.
//

import Combine

public class LoginManager {
    
    public static let shared: LoginManager = LoginManager()
    
    private var _isLogin = CurrentValueSubject<Bool, Never>(UserDefaultsKey.IsLogin.bool)
    public var isLogin: CurrentValueSubject<Bool, Never> {
        get { return self._isLogin }
        set { self._isLogin = newValue }
    }
    
    public init() {}
    
    public func login() {
        UserDefaultsKey.IsLogin.set(value: true)
        self.isLogin.send(true)
    }
    
    public func logout() {
        UserDefaultsKey.IsLogin.set(value: false)
        self.isLogin.send(false)
    }
}
