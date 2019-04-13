//
//  CallerSaving.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 13/04/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation
import WhoIsThisDB

protocol CallerSaving {
    func add(caller: Caller)
}
