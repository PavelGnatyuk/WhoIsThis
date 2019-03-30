//
//  AddCallerViewModel.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 24/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation

enum AddCallerViewModelType {
    case blockCaller
    case identifyCaller
}

extension AddCallerViewModelType {
    static func make(type: AddCallerViewModelType) -> AddCallerViewModel {
        var viewModel = AddCallerViewModel(type: type)
        switch type {
        case blockCaller:
            viewModel.title = .addCallerToBlockViewControllerTitle

        default:
            viewModel.title = .addCallerToIdentifyViewControllerTitle
        }
        return viewModel
    }
}

struct AddCallerViewModel {
    let type: AddCallerViewModelType
    var title: String = ""
    var phone: String = ""
    var name: String = ""
    var note: String = ""
    
    init(type: AddCallerViewModelType) {
        self.type = type
    }
}

extension String {
    static let addCallerToBlockViewControllerTitle = "Block caller"
    static let addCallerToIdentifyViewControllerTitle = "Identify caller"
}
