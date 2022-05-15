//
//  VerificationViewModel.swift
//  Login
//
//  Created by Phittaya Wongsuwan on 15/5/2565 BE.
//

import SwiftUI

class VerificationViewModel: ObservableObject {
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
}

