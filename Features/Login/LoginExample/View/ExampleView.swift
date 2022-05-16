//
//  ExampleView.swift
//  LoginExample
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import SwiftUI
import Core

struct ExampleView: View {
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Button {
                        if UserDefaultsKey.IsLogin.bool {
                            UserDefaultsKey.IsLogin.set(value: false)
                        } else {
                            self.login()
                        }
                    } label: {
                        Text(UserDefaultsKey.IsLogin.bool ? "Logout" : "Login")
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
    
    private func login() {
        let scene = LoginScene.login
        let transition: SceneTransitionType = .present(scene: scene, animated: true)
        let coordinator: SceneCoordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
