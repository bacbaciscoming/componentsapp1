//
//  TutorialPageViewModelTests.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 25/4/2565 BE.
//

import Combine
import XCTest
@testable import Tutorial

class TutorialPageViewModelTests: XCTestCase {

    private var spy = GetTutorialUsecaseSpy()
    private var sut: TutorialPageViewModel!

    func test_GetTutorial_ShouldSuccess() {
        let expect = [TutorialModel(id: "id", name: "", description: "", imageUrl: "")]
        spy.stubbedExecuteResult = Just(expect)
            .eraseToAnyPublisher()
        sut = TutorialPageViewModel(tutorialUsecase: spy)
        XCTAssertEqual(sut.tutorials.count, 1)
        XCTAssertEqual(sut.state, .loaded)
    }
    
    func test_GetTutorial_ShouldSuccessWithEmptyList() {
        let expect: [TutorialModel] = []
        spy.stubbedExecuteResult = Just(expect)
            .eraseToAnyPublisher()
        sut = TutorialPageViewModel(tutorialUsecase: spy)
        XCTAssertEqual(sut.tutorials.count, 0)
        XCTAssertEqual(sut.state, .idle)
    }
    
    func test_IncresePage_ShouldSuccess() {
        let expect: [TutorialModel] = []
        spy.stubbedExecuteResult = Just(expect)
            .eraseToAnyPublisher()
        sut = TutorialPageViewModel(tutorialUsecase: spy)
        sut.increasePage()
        XCTAssertEqual(sut.pageIndex, 1)
    }
}
