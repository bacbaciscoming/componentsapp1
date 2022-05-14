//
//  Decoder+Extension.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import Foundation

extension Decoder {
    public subscript(_ key: String) -> (Decoder, String) {
        return (self, key)
    }
}
