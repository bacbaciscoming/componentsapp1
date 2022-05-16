//
//  AppColor.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

import SwiftUI

public struct AppColor {
    public static var dominant: Color {
        let bundle = Bundle(identifier: BundleIdentifier.core.rawValue)
        return Color("Dominant", bundle: bundle)
    }
    
    public static var secondary: Color {
        let bundle = Bundle(identifier: BundleIdentifier.core.rawValue)
        return Color("Secondary", bundle: bundle)
    }
    
    public static var accent: Color {
        let bundle = Bundle(identifier: BundleIdentifier.core.rawValue)
        return Color("Accent", bundle: bundle)
    }
}
