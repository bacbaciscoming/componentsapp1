//
//  VerificationView.swift
//  Login
//
//  Created by Phittaya Wongsuwan on 15/5/2565 BE.
//

import SwiftUI

struct VerificationView: View {
    
    enum Field {
        case field1
        case field2
        case field3
        case field4
        case field5
        case field6
    }
    
    @StateObject var viewModel: VerificationViewModel = .init()
    // MARK: TextField FocusState
    @FocusState var activeField: Field?
    
    var body: some View {
        NavigationView {
            VStack {
                OTPField()
                
                Button {
                    
                } label: {
                    Text("Verify")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.blue)
                        )
                    
                }
                .disabled(checkState())
                .opacity(checkState() ? 0.4 : 1)
                .padding(.vertical)
                
                HStack(spacing: 12) {
                    Text("Didn't get api")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Button("Resend") {
                        
                    }
                    .font(.callout)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle("Verification")
            .onChange(of: viewModel.otpFields) { newValue in
                OTPCondition(value: newValue)
            }
        }
    }
    
    func checkState() -> Bool {
        for index in 0..<6 {
            if viewModel.otpFields[index].isEmpty { return true }
        }
        return false
    }
    
    // MARK: Conditions For Custom OTP Field & Limiting Only One Text
    func OTPCondition(value: [String]) {
        
        // Moving Next Field If Current Field Type
        for index in 0..<5 {
            if value[index].count == 1 && activeStateForIndex(index: index) == activeField {
                activeField = activeStateForIndex(index: index + 1)
            }
        }
        
        // Moving Back if Current is Empty And Previous is not Empty
        for index in 1..<5 {
            if value[index].isEmpty && !value[index - 1].isEmpty {
                activeField = activeStateForIndex(index: index - 1)
            }
        }
        
        
        for index in 0..<6 {
            if value[index].count > 1 {
                viewModel.otpFields[index] = String(value[index].last!)
            }
        }
    }
    
    // MARK: Custom OTP TextField
    @ViewBuilder
    func OTPField() -> some View {
        HStack(spacing: 14) {
            ForEach(0..<6, id: \.self) { index in
                VStack(spacing: 8) {
                    TextField("", text: $viewModel.otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeField, equals: activeStateForIndex(index: index))
                    
                    Rectangle()
                        .fill(activeField == activeStateForIndex(index: index) ? .blue : .gray.opacity(0.3))
                        .frame(height: 4)
                }
                .frame(width: 40)
            }
        }
    }
    
    func activeStateForIndex(index: Int) -> Field {
        switch index {
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        case 3: return .field4
        case 4: return .field5
        default: return .field6
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        // Here we've wrapped `VerificationView` in a `ZStack { ... }` View
        // so that it won't be the top-level View in our Preview, to avoid
        // the known bug that causes the `@FocusState` property of a
        // top-level View rendered inside of a Preview, to not work properly.
        ZStack {
            VerificationView()
        }
    }
}


