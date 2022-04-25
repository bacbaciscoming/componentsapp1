//
//  GetTutorialUsecaseTests.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import Combine
import XCTest
@testable import Tutorial

class GetTutorialUsecaseTests: XCTestCase {

    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
    }
    
    func test_GetTutorial_ShouldSucess() {
        // Given
        let spy = GetTutorialRepositorySpy()
        let expect = [TutorialModel(id: "id", name: "", description: "", imageUrl: "")]
        spy.stubbedGetTutorialResult = Just(expect)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        let usecase = GetTutorialUsecaseImpl(repository: spy)
        // When
        usecase.execute().sink { _ in
        } receiveValue: { tutorials in
            // Then
            XCTAssertEqual(tutorials[0].id, "id")
        }
        .store(in: &self.anyCancellable)
    }
    
    func test_GetTutorial_ShouldSucessWithEmptyList() {
        // Given
        let spy = GetTutorialRepositorySpy()
        spy.stubbedGetTutorialResult = Just(nil)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        let usecase = GetTutorialUsecaseImpl(repository: spy)
        // When
        usecase.execute().sink { _ in
        } receiveValue: { tutorials in
            // Then
            XCTAssertEqual(tutorials.count, 0)
        }
        .store(in: &self.anyCancellable)
    }
}
