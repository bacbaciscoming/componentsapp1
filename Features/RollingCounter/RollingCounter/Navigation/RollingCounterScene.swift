//
//  RollingCounterScene.swift
//  RollingCounter
//
//  Created by Phittaya Wongsuwan on 9/7/2565 BE.
//

import UIKit
import SwiftUI
import Core

public enum RollingCounterScene {
    case rolling
}

extension RollingCounterScene: SceneType {
    
    public func viewController() -> UIViewController {
        switch self {
        case .rolling:
            let viewController: UIViewController = UIHostingController(rootView: RollingCounterView())
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isHidden = true
            return navigationController
        }
    }
}

extension RollingCounterScene {
    func dismiss() {
        let transition: SceneTransitionType = .dismiss(animated: true)
        let coordinator: SceneCoordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}
