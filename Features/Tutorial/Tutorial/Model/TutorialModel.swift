//
//  TutorialModel.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import SwiftUI

public struct TutorialModel: Identifiable, Equatable {
    public let id = UUID()
    public var name: String
    public var description: String
    public var imageUrl: String
    public var tag: Int
}
