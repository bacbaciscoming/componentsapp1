//
//  Encoder+Extension.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import Foundation

extension Encoder {
    public subscript(_ key: String) -> (Encoder, String) {
        return (self, key)
    }
}
