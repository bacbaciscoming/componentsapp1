//
//  CodableJsonObjectToStringTransform.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import Foundation


public class CodableJsonObjectToStringTransform: CodableTransformType {
    public typealias Object = String
    public typealias JSON = Any
    
    public init() {
        
    }
    
    public func transformFromJSON(_ value: Any?) -> String? {
        if let nestedArray: [[String: Any]] = value as? [[String: Any]] {
            do {
                let jsonData: Data = try JSONSerialization.data(withJSONObject: nestedArray, options: .prettyPrinted)
                return String(decoding: jsonData, as: UTF8.self)
            } catch {

            }
        } else if let dictionary: [String: Any] = value as? [String: Any] {
            do {
                let jsonData: Data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
                return String(decoding: jsonData, as: UTF8.self)
            } catch {

            }
        }
        return nil
    }
    
    public func transformToJSON(_ value: String?) -> Any? {
        return nil
    }
}
