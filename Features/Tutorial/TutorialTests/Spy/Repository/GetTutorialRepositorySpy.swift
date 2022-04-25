//
//  GetTutorialRepositorySpy.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 25/4/2565 BE.
//

import Combine
@testable import Tutorial

final class GetTutorialRepositorySpy: GetTutorialRepository {
    
    var invokedGetTutorial = false
    var invokedGetTutorialCount = 0
    var stubbedGetTutorialResult: AnyPublisher<[TutorialModel]?, Error>!
    
    func getTutorial() -> AnyPublisher<[TutorialModel]?, Error> {
        invokedGetTutorial = true
        invokedGetTutorialCount += 1
        return stubbedGetTutorialResult
    }
}
