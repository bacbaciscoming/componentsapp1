//
//  VerificationViewModel.swift
//  Login
//
//  Created by Phittaya Wongsuwan on 15/5/2565 BE.
//

import SwiftUI
import Firebase

class VerificationViewModel: ObservableObject {
    
    // MARK: Login Data
    @Published var number: String = ""
    @Published var code: String = ""
    
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
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
        PhoneAuthProvider.provider().verifyPhoneNumber("+\(code)", uiDelegate: nil) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let result = result {
                    self.verificationCode = result
                } else {
                    self.errorMsg = error?.localizedDescription ?? ""
                    self.showAlert.toggle()
                }
            }
        }
    }
}

