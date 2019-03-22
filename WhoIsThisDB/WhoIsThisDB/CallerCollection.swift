//
//  CallerCollection.swift
//  WhoIsThisDB
//
//  Created by Pavel Gnatyuk on 16/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation

public struct CallerCollection {
    private var collection = [Caller]()
    
    public var count: Int {
        return collection.count
    }
    
    public init() {
        
    }
    
    public subscript(index: Int) -> Caller {
        get {
            return collection[index]
        }
        set {
            collection[index] = newValue
        }
    }
    
    public mutating func add(caller: Caller) {
        collection.append(caller)
    }
}
