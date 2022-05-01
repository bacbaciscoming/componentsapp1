//
//  GetTutorialRepository.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import SwiftUI
import Combine
import Core

public protocol GetTutorialRepository {
    func getTutorial() -> AnyPublisher<[TutorialModel]?, Error>
}

public final class GetTutorialRepositoryImpl: GetTutorialRepository {

    public init() {}
    
    public func getTutorial() -> AnyPublisher<[TutorialModel]?, Error> {
        return Future<[TutorialModel]?, Error> { promise in
            do {
                if let bundlePath = Bundle(identifier: BundleIdentifier.core.rawValue)?.path(forResource: "TutorialResponse",
                                                     ofType: "json"),
                    let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    let response = try JSONDecoder().decode(TutorialResponse.self, from: jsonData)
                    promise(.success(response.data))
                }
            } catch (let e) {
                promise(.failure(e))
            }
        }
        .eraseToAnyPublisher()
    }
}


