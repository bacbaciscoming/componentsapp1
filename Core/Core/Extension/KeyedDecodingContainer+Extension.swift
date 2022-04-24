//
//  KeyedDecodingContainer+Extension.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

extension KeyedDecodingContainer where K == AnyKey {

    func decodeAllPrimitive<Transform: CodableTransformType>(transform: Transform, forMappedKey key: String) -> Transform.Object?  {
        if let value = try? decodeIfPresent(String.self, forKey: AnyKey(stringValue: key)) {
            return transform.transformFromJSON(value)
        } else if let value = try? decodeIfPresent(Int.self, forKey: AnyKey(stringValue: key)) {
            return transform.transformFromJSON(value)
        } else if let value = try? decodeIfPresent(Bool.self, forKey: AnyKey(stringValue: key)) {
            return transform.transformFromJSON(value)
        } else if let value = try? decodeIfPresent(Double.self, forKey: AnyKey(stringValue: key)) {
            return transform.transformFromJSON(value)
        } else if let value = try? decodeIfPresent(Float.self, forKey: AnyKey(stringValue: key)) {
            return transform.transformFromJSON(value)
        }
        return nil
    }
    
    func decodeCollectionType<Transform: CodableTransformType>(transform: Transform, forMappedKey key: String) -> Transform.Object? {
        if let value = try? decodeIfPresent(Array<Any>.self, forKey: AnyKey(stringValue: key)) {
            return transform.transformFromJSON(value)
        } else if let value = try? decodeIfPresent([String: Any].self, forKey: AnyKey(stringValue: key)) {
            return transform.transformFromJSON(value)
        }
        return nil
    }
}
