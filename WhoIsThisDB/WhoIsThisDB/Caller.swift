//
//  Caller.swift
//  WhoIsThisDB
//
//  Created by Pavel Gnatyuk on 16/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation

public struct Caller {
    public var identifier: UUID = UUID()
    public var name: String
    public var phone: String
    public var note: String
    
    public init(name: String = "", phone: String = "", note: String = "") {
        self.name = name
        self.phone = phone
        self.note = note
    }
}
