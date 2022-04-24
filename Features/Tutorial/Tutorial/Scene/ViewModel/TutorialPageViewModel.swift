//
//  TutorialPageViewModel.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import SwiftUI
import Combine

class TutorialPageViewModel: ObservableObject {
    
    enum State {
        case idle
        case loaded
    }
    
    @Published var state: State = .idle
    @Published var pageIndex: Int = 0
    @Published var tutorials: [TutorialModel] = []
    private let tutorialUsecase: GetTutorialUsecase = GetTutorialUsecaseImpl()
    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init() {
        self.getTutorial()
    }
    
    private func getTutorial() {
        self.tutorialUsecase.execute()
            .sink { _ in
            } receiveValue: { tutorials in
                self.tutorials = self.setTag(tutorials: tutorials)
                self.state = .loaded
        }
        .store(in: &self.anyCancellable)
    }
    
    private func setTag( tutorials: [TutorialModel]) -> [TutorialModel] {
        var tag: Int = 0
        var newTutorials: [TutorialModel] = []
        for tutorial in tutorials {
            var newTutorial = tutorial
            newTutorial.tag = tag
            tag += 1
            newTutorials.append(newTutorial)
        }
        return newTutorials
    }
    
    func increasePage() {
        self.pageIndex += 1
    }
    
    func goToZero() {
        self.pageIndex = 0
    }
}
