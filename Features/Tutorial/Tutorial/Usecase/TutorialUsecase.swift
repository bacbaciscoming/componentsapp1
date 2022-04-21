//
//  TutorialUsecase.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import Combine

public protocol TutorialUsecase {
    func execute() -> AnyPublisher<[TutorialModel], Error>
}

public final class TutorialUsecaseImpl: TutorialUsecase {
    
    private let tutorials: [TutorialModel] = [TutorialModel(name: "name1",
                                                            description: "description1",
                                                            imageUrl: "work",
                                                            tag: 0),
                                              TutorialModel(name: "name2",
                                                            description: "description2",
                                                            imageUrl: "cowork",
                                                            tag: 1)]
    
    public init() {}
    
    public func execute() -> AnyPublisher<[TutorialModel], Error> {
        return Future<[TutorialModel], Error> { promise in
            promise(.success(self.tutorials))
        }
        .eraseToAnyPublisher()
    }
}
