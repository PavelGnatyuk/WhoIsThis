//
//  CallerCollection.swift
//  WhoIsThisDB
//
//  Created by Pavel Gnatyuk on 16/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation

public class CallerCollection: Collection {
    
    enum Constants {
        static let callerAttributeName = "caller"
    }
    
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
    
    public func add(caller: Caller) {
        collection.append(caller)
        post(added: caller)
    }

    public func index(after i: Int) -> Int {
        return collection.index(after: i)
    }
    
    public var startIndex: Int {
        return collection.startIndex
    }
    
    public var endIndex: Int {
        return collection.endIndex
    }
    
}

fileprivate extension CallerCollection {
    func post(added caller: Caller) {
        NotificationCenter.default.post(name: .didAddCaller, object: self, userInfo: [Constants.callerAttributeName : caller] )
    }
}

extension Notification.Name {
    static public let didAddCaller = Notification.Name("com.WhoIsThisDB.didAddCaller")
}
