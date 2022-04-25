//
//  TutorialResponseTests.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 25/4/2565 BE.
//

import XCTest
@testable import Tutorial

class TutorialResponseTests: XCTestCase {

    func test_InitModel_ShouldSuccess() {
        let model = TutorialResponse()
        XCTAssertNotNil(model)
    }
    
    func test_InitFromDecoder_ShouldSuccess() {
        let json = """
        {
         "code": 0
        }
        """.data(using: .utf8)!

        let model = try? JSONDecoder().decode(TutorialResponse.self, from: json)
        XCTAssertNotNil(model)
    }
}
