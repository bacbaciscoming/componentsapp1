//
//  LoginView.swift
//  Login
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import SwiftUI
import Core

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 10) {
                    VStack(spacing: 8) {
                        TextField("+66", text: $viewModel.code)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                        
                        Rectangle()
                            .fill(viewModel.code == "" ? .gray.opacity(0.35) : .blue)
                            .frame(height: 2)
                        
                    }
                    .frame(width: 40)
                    
                    VStack(spacing: 8) {
                        TextField("", text: $viewModel.number)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                        
                        Rectangle()
                            .fill(viewModel.code == "" ? .gray.opacity(0.35) : .blue)
                            .frame(height: 2)
                    }
                    
                    Button {
                        self.viewModel.sendOTP()
                    } label: {
                        Text("Login")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.blue)
                                    .opacity(viewModel.isLoading ? 0 : 1)
                            )
                            .overlay {
                                ProgressView()
                                    .opacity(viewModel.isLoading ? 1 : 0)
                            }
                        
                    }
                    .disabled(viewModel.code == "" || viewModel.number == "")
                    .opacity(viewModel.code == "" || viewModel.number == "" ? 0.4 : 1)
                }
                .padding(.vertical)
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle("Login")
            .navigationBarItems(leading: self.backButton())
            .alert(viewModel.errorMsg, isPresented: $viewModel.showAlert) {}
        }
    }
    
    private func backButton() -> AnyView {
        return AnyView(
            Button(action: {
                LoginScene.login.dismiss()
            }) {
                Image(systemName: "chevron.down")
                    .frame(width: 24, height: 24, alignment: .center)
                    .foregroundColor(Color.black)
            }
            .frame(width: 34, height: 34, alignment: .center)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
