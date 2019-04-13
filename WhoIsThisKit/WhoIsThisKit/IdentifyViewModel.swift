//
//  IdentifyViewModel.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation
import WhoIsThisDB

struct IdentifyViewModel {
    var title: String = .identifyViewControllerTitle
    
    var collection: CallerCollection
    
    init(callers: CallerCollection) {
        self.collection = callers
    }
    
    mutating func add(caller: Caller) {
        collection.add(caller: caller)
    }
}

fileprivate extension String {
    static let identifyViewControllerTitle = "Identify"
}
