//
//  CallerSaver.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 13/04/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation
import WhoIsThisDB

class CallerSaver: CallerSaving {
    private var collection: CallerCollection
    
    init(collection: CallerCollection) {
        self.collection = collection
    }
    
    func add(caller: Caller) {
        collection.add(caller: caller)
    }
}
