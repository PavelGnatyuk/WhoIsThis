//
//  SettingsViewModel.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 16/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import Foundation

struct SettingsViewModel {
    var title: String = .settingsViewControllerTitle
}

fileprivate extension String {
    static let settingsViewControllerTitle = "Settings"
}
