//
//  SceneTransitionType.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import UIKit

public enum SceneTransitionType {
    case present(scene: SceneType, animated: Bool, presentationStyle: UIModalPresentationStyle = .overFullScreen)
    case dismiss(animated: Bool)
}
