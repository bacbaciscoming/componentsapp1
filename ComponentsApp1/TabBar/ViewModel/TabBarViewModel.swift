//
//  TabBarViewModel.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 17/5/2565 BE.
//

import SwiftUI
import Combine
import Login
import Core
import RollingCounter

class TabBarViewModel: ObservableObject {
    
    @Published var currentTab: Tab = .home
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
    
    func goRolling() {
        let scene = RollingCounterScene.rolling
        let transition: SceneTransitionType = .present(scene: scene, animated: true)
        let coordinator: SceneCoordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}
