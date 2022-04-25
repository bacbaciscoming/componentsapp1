//
//  GetTutorialUsecaseSpy.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 25/4/2565 BE.
//

import Combine
@testable import Tutorial

final class GetTutorialUsecaseSpy: GetTutorialUsecase {
    
    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: AnyPublisher<[TutorialModel], Never>!
    
    func execute() -> AnyPublisher<[TutorialModel], Never> {
        invokedExecute = true
        invokedExecuteCount += 1
        return stubbedExecuteResult
    }
}
