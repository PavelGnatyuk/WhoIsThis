//
//  CallersViewModel.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 16/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation
import WhoIsThisDB

struct CallersViewModel {
    let title: String = .callersViewControllerTitle
    
    let callers = CallerCollection()
}

fileprivate extension String {
    static let callersViewControllerTitle: String = "Callers"
}
