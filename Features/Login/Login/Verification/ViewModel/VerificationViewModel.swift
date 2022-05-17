//
//  VerificationViewModel.swift
//  Login
//
//  Created by Phittaya Wongsuwan on 15/5/2565 BE.
//

import SwiftUI
import Firebase
import Core

class VerificationViewModel: ObservableObject {
    
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    // MARK: Error
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    // MARK: OTP Credentials
    @Published var verificationCode: String
    
    @Published var isLoading: Bool = false
    
    init(verificationCode: String) {
        self.verificationCode = verificationCode
    }
    
    func verifyOTP() {
        self.isLoading = true
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
        Auth.auth().signIn(with: credential) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                LoginManager.shared.login()
                LoginScene.login.dismiss()
            }
        }  
    }
}

