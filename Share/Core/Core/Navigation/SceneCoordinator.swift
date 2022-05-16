//
//  SceneCoordinator.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import Foundation
import UIKit
import Combine

public protocol SceneCoordinatorType {
    func transition(type: SceneTransitionType)
}

public protocol SwitchTabbarAction: AnyObject {
    func switchTabbar(index: Int)
}

public class SceneCoordinator: SceneCoordinatorType {
    public static weak var delegate: SwitchTabbarAction? = nil
    
    private weak var window: UIWindow!
    private var currentViewController: UIViewController {
        return UIApplication.topViewController() ?? rootViewController
    }
    
    private var rootViewController: UIViewController {
        return window.rootViewController ?? UIViewController()
    }
    
    private var topViewController: UIViewController {
        return UIApplication.topViewController() ?? UIViewController()
    }
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public init() {
        self.window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first ?? UIWindow()
    }
    
    public func transition(type: SceneTransitionType) {
        switch type {
        case .push(let scene, let animated):
            let viewController = scene.viewController()
            if let navigationController = currentViewController.navigationController {
                navigationController.navigationBar.isHidden = true
                navigationController.pushViewController(viewController, animated: animated)
            }
        case .present(let scene, let animated, let presentationStyle):
            let viewController = scene.viewController()
            viewController.modalPresentationStyle = presentationStyle
            self.currentViewController.present(viewController, animated: animated)
        case .pop(animated: let animated):
            if let navigationController = currentViewController.navigationController {
                navigationController.popViewController(animated: animated)
            }
        case .dismiss(let animated):
            if let presentingViewController = currentViewController.presentingViewController {
                presentingViewController.dismiss(animated: animated, completion: nil)
            }
        }
    }
}


