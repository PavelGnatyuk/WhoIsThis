//
//  CallerCollection.swift
//  WhoIsThisDB
//
//  Created by Pavel Gnatyuk on 16/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation

public struct CallerCollection {
    
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
    
    public mutating func add(caller: Caller) {
        collection.append(caller)
        post(added: caller)
    }
}

fileprivate extension CallerCollection {
    func post(added caller: Caller) {
        NotificationCenter.default.post(name: .didAddCaller, object: self, userInfo: [Constants.callerAttributeName : caller] )
    }
}

extension Notification.Name {
    static let didAddCaller = Notification.Name("com.WhoIsThisDB.didAddCaller")
}
