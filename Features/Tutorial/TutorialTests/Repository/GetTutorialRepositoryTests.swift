//
//  GetTutorialRepositoryTests.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 25/4/2565 BE.
//

import Combine
import XCTest
@testable import Tutorial

class GetTutorialRepositoryTests: XCTestCase {

    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func test_GetTutorial_ShouldSuccess() {
        let repo = GetTutorialRepositoryImpl()
        repo.getTutorial().sink { _ in
        } receiveValue: { tutorials in
            XCTAssertNotNil(tutorials)
        }
        .store(in: &self.anyCancellable)
    }
}
