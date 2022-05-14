//
//  CodableInfixOperator.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import Foundation

infix operator <-

// MARK: Decodable
//for non-optional T
public func <- <T: Decodable>(left: inout T, right: (Decoder, String)) throws  {
    let (decoder, key) = right
    let container = try decoder.container(keyedBy: AnyKey.self)
    left = try container.decode(T.self, forKey: AnyKey(stringValue: key))
}

//for optional T
public func <- <T: Decodable>(left: inout T?, right: (Decoder, String)) throws  {
    let (decoder, key) = right
    let container = try decoder.container(keyedBy: AnyKey.self)
    do {
        left = try container.decodeIfPresent(T.self, forKey: AnyKey(stringValue: key))
    } catch {
        left = nil
    }
    
}


//for CodableTransformType
public func <- <Transform: CodableTransformType>(left: inout Transform.Object?, right: ((Decoder, String), Transform)) throws {
    let ((decoder, key), transform) = right
    let container = try decoder.container(keyedBy: AnyKey.self)
    if let primitive = container.decodeAllPrimitive(transform: transform, forMappedKey: key) {
        left = primitive
    } else if let collectionType = container.decodeCollectionType(transform: transform, forMappedKey: key) {
        left = collectionType
    }
}



// MARK: Encodable
//for non-optional T
public func <- <T: Encodable>(left: T, right: (Encoder, String)) throws  {
    let (encoder, key) = right
    var container = encoder.container(keyedBy: AnyKey.self)
    try container.encode(left, forKey: AnyKey(stringValue: key))
}

//for optional T
public func <- <T: Encodable>(left: T?, right: (Encoder, String)) throws  {
    let (encoder, key) = right
    var container = encoder.container(keyedBy: AnyKey.self)
    try container.encodeIfPresent(left, forKey: AnyKey(stringValue: key))
}

//for TransformType
public func <- <Transform: CodableTransformType>(left: Transform.Object?, right: ((Encoder, String), Transform)) throws {
    let ((encoder, key), transform) = right
    var container = encoder.container(keyedBy: AnyKey.self)
    if let value = transform.transformToJSON(left) as? String {
        try container.encodeIfPresent(value, forKey: AnyKey(stringValue: key))
    }
}


