//
//  SeeMoreScene.swift
//  SeeMore
//
//  Created by Phittaya Wongsuwan on 27/9/2565 BE.
//

import Core
import Foundation
import SwiftUI

public enum SeeMoreScene {
    case seeMore
}

extension SeeMoreScene: SceneType {
    public func viewController() -> UIViewController {
        switch self {
        case .seeMore:
            let viewController: UIViewController = UIHostingController(rootView: SeeMoreView(viewModel: SeeMoreViewModel()))
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isHidden = true
            return navigationController
        }
    }
}

extension SeeMoreScene {
    func dismiss() {
        let transition: SceneTransitionType = .dismiss(animated: true)
        let coordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}
