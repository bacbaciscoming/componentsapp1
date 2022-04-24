//
//  GetTutorialUsecase.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import Combine

public protocol GetTutorialUsecase {
    func execute() -> AnyPublisher<[TutorialModel], Never>
}

public final class GetTutorialUsecaseImpl: GetTutorialUsecase {
    
    private var repository: GetTutorialRepository
    
    public init(repository: GetTutorialRepository = GetTutorialRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute() -> AnyPublisher<[TutorialModel], Never> {
        return self.repository.getTutorial()
            .replaceError(with: [])
            .map { tutorialModels -> [TutorialModel] in
                return tutorialModels?.filter { $0.id != nil } ?? []
            }
            .eraseToAnyPublisher()
    }
}
