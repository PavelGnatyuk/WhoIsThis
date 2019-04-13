//
//  AddCallerViewModel.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 24/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation

struct CallerViewModel {
    
    enum ModelType {
        case blockCaller
        case identifyCaller
    }

    let type: ModelType
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

    init(type: ModelType) {
        self.type = type
    }
}

extension CallerViewModel {
    enum Factory {
        static func make(type: ModelType) -> CallerViewModel {
            var viewModel = CallerViewModel(type: type)
            switch type {
            case .blockCaller:
                viewModel.title = .addCallerToBlockViewControllerTitle
                
            default:
                viewModel.title = .addCallerToIdentifyViewControllerTitle
            }
            return viewModel
        }
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
