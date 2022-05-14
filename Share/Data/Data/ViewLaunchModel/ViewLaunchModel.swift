//
//  ViewLaunchModel.swift
//  Data
//
//  Created by Phittaya Wongsuwan on 14/5/2565 BE.
//

import SwiftUI
import Core

public class ViewLaunchModel: ObservableObject {
    
    @Published public var currentPage: ViewLaunch
    
    public init() {
        if !UserDefaultsKey.LaunchBefore.bool {
            self.currentPage = .tutorial
        } else {
            self.currentPage = .tabBar
        }
    }
}
