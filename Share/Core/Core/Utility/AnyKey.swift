//
//  AnyKey.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import Foundation

public struct AnyKey: CodingKey {
    public var stringValue: String
    public var intValue: Int?
    public init(stringValue: String) {
        self.stringValue = stringValue
    }

    public init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
}
