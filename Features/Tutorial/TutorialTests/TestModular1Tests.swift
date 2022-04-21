//
//  TestModular1Tests.swift
//  TestModular1Tests
//
//  Created by Phittaya Wongsuwan on 19/4/2565 BE.
//

import XCTest
@testable import Tutorial

class TestModular1Tests: XCTestCase {

    func testTestModular1() {
        XCTAssertEqual(TestModular1.callModular(), "called")
    }
}
