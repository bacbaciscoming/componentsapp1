//
//  KeyedEncodingContainer+Extension.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import Foundation

extension KeyedEncodingContainer where K == AnyKey {
    func encodeDelimiter<T>(_ value: T?, _ delimiter: String = ".", fullKey: String) throws where T : Encodable {
        var stringList: ArraySlice<String> = ArraySlice(fullKey.components(separatedBy: delimiter))
        let lastValue: String? = stringList.last
        stringList = stringList.dropLast()
        var nestedContainer: KeyedEncodingContainer<K> = self
        while let firstKey: String = stringList.first {
            nestedContainer = nestedContainer.nestedContainer(keyedBy: K.self, forKey: AnyKey(stringValue: firstKey))
            stringList = stringList.dropFirst()
        }
        try nestedContainer.encodeIfPresent(value, forKey: AnyKey(stringValue: lastValue ?? ""))
    }
}
