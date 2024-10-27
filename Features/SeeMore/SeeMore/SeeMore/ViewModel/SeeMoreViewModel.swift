//
//  SeeMoreViewModel.swift
//  SeeMore
//
//  Created by Phittaya Wongsuwan on 28/9/2565 BE.
//

import Combine
import Foundation
import SwiftUI

class SeeMoreViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed
        case loaded
    }

    @Published private(set) var state: State = .idle
    @Published var topNavList: [String] = []
    @Published var focusIndex: Int = 0

    private var anyCancellable = Set<AnyCancellable>()

    init() {
        setObserve()
        if x == 0 {}
    }

    private func setObserve() {
        $focusIndex
            .dropFirst()
            .sink { index in
                _ = print("💥 focusIndex = \(index)")
                self.getContent()
            }
            .store(in: &anyCancellable)
    }

    func getTopNevigation() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.topNavList = ["For you", "True Special", "Anime", "Thai Series", "Korea Series"]
            self.getContent()
        }
    }

    func getContent() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .loaded
        }
    }
}
