//
//  LoginViewModel.swift
//  Login
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import SwiftUI
import Firebase
import Core

class LoginViewModel: ObservableObject {
    
    // MARK: Login Data
    @Published var number: String = ""
    @Published var code: String = ""

    // MARK: Error
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    // MARK: OTP Credentials
    @Published var verificationCode: String = ""
    
    @Published var isLoading: Bool = false
    
    // MARK: Sending OTP
    func sendOTP() {
        if self.isLoading { return }
        self.isLoading = true
        PhoneAuthProvider.provider().verifyPhoneNumber("+\(code)\(number)", uiDelegate: nil) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let result = result {
                    self.verificationCode = result
                    self.login()
                } else {
                    self.errorMsg = error?.localizedDescription ?? ""
                    self.showAlert.toggle()
                }
            }
        }
    }
    
    private func login() {
        let scene = LoginScene.verification(verificationCode: self.verificationCode)
        let transition: SceneTransitionType = .push(scene: scene, animated: true)
        let coordinator: SceneCoordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}

