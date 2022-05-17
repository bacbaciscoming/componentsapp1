//
//  ExampleViewModel.swift
//  LoginExample
//
//  Created by Phittaya Wongsuwan on 17/5/2565 BE.
//

import SwiftUI
import Combine
import Core

class ExampleViewModel: ObservableObject {
    
    @Published var isLogin: Bool = false
    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init() {
        self.subscribeIsLogin()
    }
    
    private func subscribeIsLogin() {
        LoginManager.shared.isLogin
            .assign(to: \.isLogin, on: self)
            .store(in: &self.anyCancellable)
    }
    
    func login() {
        let scene = LoginScene.login
        let transition: SceneTransitionType = .present(scene: scene, animated: true)
        let coordinator: SceneCoordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
    
    func logout() {
        LoginManager.shared.logout()
    }
}
