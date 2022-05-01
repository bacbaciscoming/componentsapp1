//
//  TutorialViewTests.swift
//  TutorialTests
//
//  Created by Phittaya Wongsuwan on 30/4/2565 BE.
//

// MASK: SnapshotTesting Examples

//import SnapshotTesting
//import SwiftUI
//import XCTest
//@testable import Tutorial
//
//private let referenceSize = CGSize(width: 150, height: 50)
//private let model = TutorialModel(id: "1", name: "name", description: "description", imageUrl: "work")
//
//class TutorialViewTests: XCTestCase {
//
//    func test_TutorialView() {
//        // Set isRecording = true to globally to store all snapshots
//        // Pass record: true to verifySnapshot to store just one snapshot (need to take a new snapshot)
//
//        let result = verifySnapshot(matching: TutorialView(tutorial: model).toVC(),
//                                    as: .image,
//                                    named: "TutorialView",
////                                    record: true,
//                                    testName: "View")
//        XCTAssertNil(result)
//    }
//}
//
//private extension SwiftUI.View {
//    func toVC() -> UIViewController {
//        let vc = UIHostingController(rootView: self)
//        vc.view.frame = UIScreen.main.bounds
//        return vc
//    }
//}
