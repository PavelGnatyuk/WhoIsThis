//
//  CallerLoader.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation
import WhoIsThisDB

class CallerLoader: CallerLoading {
    func load() -> CallerCollection {
        let collection = CallerCollection()
        var cnt = 0
        while cnt < 5 {
            cnt += 1
            var caller = Caller()
            caller.name = "Caller \(cnt)"
            caller.phone = "972_54_808865\(cnt)"
            caller.note = "Note \(cnt)"
            collection.add(caller: caller)
        }
        return collection
    }
}
