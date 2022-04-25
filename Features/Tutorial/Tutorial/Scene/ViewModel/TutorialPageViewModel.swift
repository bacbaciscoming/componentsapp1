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
    private let tutorialUsecase: GetTutorialUsecase
    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(tutorialUsecase: GetTutorialUsecase = GetTutorialUsecaseImpl()) {
        self.tutorialUsecase = tutorialUsecase
        self.getTutorial()
    }
    
    private func getTutorial() {
        self.tutorialUsecase.execute()
            .sink { _ in
            } receiveValue: { tutorials in
                self.tutorials = self.setTag(tutorials: tutorials)
                self.state = self.tutorials.count > 0 ? .loaded : .idle
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
    
    func resetPage() {
        self.pageIndex = 0
    }
}
