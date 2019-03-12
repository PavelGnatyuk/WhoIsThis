//
//  ViewControllerFactory.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 12/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit.UIViewController
import TheTheme

protocol ViewControllerFactoring {

    var theme: Theme { get }

    func makeTabBarController() -> UITabBarController
    func makeSettingsViewController() -> SettingsViewController
    func makeCallersViewController() -> CallersViewController
    func makeSettingsNavController() -> UINavigationController
    func makeCallersNavController() -> UINavigationController
}
