//
//  TopNavigationViewModel.swift
//  SeeMore
//
//  Created by Phittaya Wongsuwan on 28/9/2565 BE.
//

import Foundation
import SwiftUI

class TopNavigationViewModel: ObservableObject {
    
    enum State {
        case idle
        case loaded
    }
    
    @Published private(set) var state: State = .idle
    @Published var topNavList: [String]
    var focusIndex: Binding<Int>
    
    init(topNavList: [String], focusIndex: Binding<Int>) {
        self.topNavList = topNavList
        self.focusIndex = focusIndex
    }
}
