//
//  LoginScene.swift
//  Login
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import UIKit
import SwiftUI
import Core

public enum LoginScene {
    case login
}

extension LoginScene: SceneType {
    
    public func viewController() -> UIViewController {
        switch self {
        case .login:
            let viewController: UIViewController = UIHostingController(rootView: LoginView())
            return viewController
        }
    }
}

extension LoginScene {
    func dismiss() {
        let transition: SceneTransitionType = .dismiss(animated: true)
        let coordinator: SceneCoordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}
