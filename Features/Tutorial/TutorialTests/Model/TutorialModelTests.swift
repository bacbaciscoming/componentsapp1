//
//  TutorialModelTests.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 25/4/2565 BE.
//

import XCTest
@testable import Tutorial

class TutorialModelTests: XCTestCase {

    func test_InitModel_ShouldSuccess() {
        let model = TutorialModel(id: "", name: "", description: "", imageUrl: "")
        XCTAssertNotNil(model)
    }
    
    func test_InitFromDecoder_ShouldSuccess() {
        let json = """
        {
         "id": ""
        }
        """.data(using: .utf8)!

        let model = try? JSONDecoder().decode(TutorialModel.self, from: json)
        XCTAssertNotNil(model)
    }
}
