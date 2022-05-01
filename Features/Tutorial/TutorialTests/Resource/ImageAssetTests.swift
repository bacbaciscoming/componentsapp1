//
//  ImageAssetTests.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 1/5/2565 BE.
//

import XCTest
@testable import Tutorial

class ImageAssetTests: XCTestCase {

    func test_LoadImage_ShouldSuccess() {
        let workImage = ImageAsset.load(RawImageAsset.work)
        XCTAssertNotEqual(workImage, UIImage())
    }
    
    func test_LoadImage_ShouldSuccessWithEmptyImage() {
        let workImage = ImageAsset.load(RawImageAsset.unknown)
        XCTAssertEqual(workImage, UIImage())
    }
}
