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
    
    var name: String {
        get {
            return updated.name.isEmpty ? caller.name : updated.name
        }
        set {
            updated.name = newValue
        }
    }

    var phone: String {
        get {
            return updated.phone.isEmpty ? caller.phone : updated.phone
        }
        set {
            updated.phone = newValue
        }
    }

    var note: String {
        get {
            return updated.note.isEmpty ? caller.note : updated.note
        }
        set {
            updated.note = newValue
        }
    }

    var hasModified: Bool {
        return !updated.name.isEmpty || !updated.phone.isEmpty || !updated.note.isEmpty
    }
    
    private var caller = CallerData()
    private var updated = CallerData()

    init(type: AddCallerViewModelType) {
        self.type = type
    }
}

fileprivate struct CallerData {
    var phone: String = ""
    var name: String = ""
    var note: String = ""
}

fileprivate extension String {
    static let addCallerToBlockViewControllerTitle = "Block caller"
    static let addCallerToIdentifyViewControllerTitle = "Identify caller"
}
