//
//  BlockViewModel.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation
import WhoIsThisDB

class BlockViewModel {
    var title: String = .blockViewControllerTitle
    
    var collection: CallerCollection
    
    var onAdded: () -> () = {}
    
    init(callers: CallerCollection) {
        self.collection = callers
        bind()
    }
    
    deinit {
        debugPrint("BlockViewModel \(#function)")
        unbind()
    }
}

fileprivate extension BlockViewModel {
    func bind() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidAddCaller(notification:)), name: .didAddCaller, object: nil)
    }
    
    func unbind() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func onDidAddCaller(notification: Notification) {
        debugPrint("\(#function)")
        onAdded()
    }
}

fileprivate extension String {
    static let blockViewControllerTitle = "Block"
}
