//
//  TutorialPageViewModel.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import SwiftUI
import Combine

class TutorialPageViewModel: ObservableObject {
    
    @Published var pageIndex: Int = 0
    @Published var tutorials: [TutorialModel] = []
    private let tutorialUsecase: TutorialUsecase = TutorialUsecaseImpl()
    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init() {
        self.getTutorial()
    }
    
    private func getTutorial() {
        self.tutorialUsecase.execute()
            .sink { _ in
            } receiveValue: { tutorials in
                self.tutorials = tutorials
        }
        .store(in: &self.anyCancellable)
    }
    
    func increasePage() {
        self.pageIndex += 1
    }
    
    func goToZero() {
        self.pageIndex = 0
    }
}
