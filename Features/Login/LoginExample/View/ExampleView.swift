//
//  ExampleView.swift
//  LoginExample
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import SwiftUI
import Core

struct ExampleView: View {
    
    @ObservedObject var viewModel: ExampleViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Button {
                        if self.viewModel.isLogin {
                            self.viewModel.logout()
                        } else {
                            self.viewModel.login()
                        }
                    } label: {
                        Text(self.viewModel.isLogin ? "Logout" : "Login")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.blue)
                            )
                        
                    }
                }
                .padding(.top, 20)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .navigationTitle("ExampleLogin")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(viewModel: ExampleViewModel())
    }
}
