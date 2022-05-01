//
//  ImageAsset.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 1/5/2565 BE.
//

import UIKit
import Core

enum RawImageAsset: String {
    case cowork = "cowork"
    case work = "work"
    case unknown
    
    func load() -> UIImage? {
        let bundle = Bundle(identifier: BundleIdentifier.tutorial.rawValue)
        return UIImage(named: self.rawValue, in: bundle, compatibleWith: nil)
    }
}

struct ImageAsset {
    static func load(_ asset: RawImageAsset) -> UIImage {
        return asset.load() ?? UIImage()
    }
}
