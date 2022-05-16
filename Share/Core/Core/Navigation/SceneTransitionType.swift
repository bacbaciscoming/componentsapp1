//
//  SceneTransitionType.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import UIKit

public enum SceneTransitionType {
    case push(scene: SceneType, animated: Bool)
    case present(scene: SceneType, animated: Bool, presentationStyle: UIModalPresentationStyle = .overFullScreen)
    case pop(animated: Bool)
    case dismiss(animated: Bool)
}
