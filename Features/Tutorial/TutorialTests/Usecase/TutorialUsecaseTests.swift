//
//  TutorialUsecaseTests.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import Combine
import XCTest
@testable import Tutorial

class TutorialUsecaseTests: XCTestCase {

    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
    }
    
//    func test_GetTutorial_ShouldSucess() {
//        // Given
//        let usecase = GetTutorialUsecaseImpl()
//        // When
//        usecase.execute().sink { _ in
//        } receiveValue: { tutorials in
//            XCTAssertEqual(tutorials[0].name, "name1")
//        }
//        .store(in: &self.anyCancellable)
//    }
}
