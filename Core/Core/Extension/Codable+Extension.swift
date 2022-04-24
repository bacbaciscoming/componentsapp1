//
//  Codable+Extension.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import Foundation

public extension Encodable {
    public func encode() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            let jsonDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
            return jsonDict
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
