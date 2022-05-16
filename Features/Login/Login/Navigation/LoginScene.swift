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
    case verification(verificationCode: String)
}

extension LoginScene: SceneType {
    
    public func viewController() -> UIViewController {
        switch self {
        case .login:
            let viewController: UIViewController = UIHostingController(rootView: LoginView())
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isHidden = true
            return navigationController
        case .verification(let verificationCode):
            let view = VerificationView(viewModel: VerificationViewModel(verificationCode: verificationCode))
            let viewController: UIViewController = UIHostingController(rootView: view)
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
