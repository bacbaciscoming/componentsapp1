//
//  TutorialResponse.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import SwiftUI
import Core

public struct TutorialResponse: Codable {
    public var code: Int?
    public var message: String?
    public var data: [TutorialModel]?
    
    public init() {}
    
    public init(from decoder: Decoder) throws {
        try code            <- decoder["code"]
        try message         <- decoder["message"]
        try data            <- decoder["data"]
    }
}

public struct TutorialModel: Codable, Hashable {
    public var id: String?
    public var name: String?
    public var description: String?
    public var imageUrl: String?
    public var tag: Int = 0

    public init(id: String?, name: String?, description: String?, imageUrl: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
    }
    
    public init(from decoder: Decoder) throws {
        try id              <- decoder["id"]
        try name            <- decoder["name"]
        try description     <- decoder["description"]
        try imageUrl        <- decoder["imageUrl"]
    }
}
