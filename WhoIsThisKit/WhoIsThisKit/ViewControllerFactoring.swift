//
//  ViewControllerFactory.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 12/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit.UIViewController
import TheTheme
import WhoIsThisDB

protocol ViewControllerFactoring {

    var theme: Theme { get }

    func makeTabBarController() -> UITabBarController
    
    func makeSettingsViewController() -> SettingsViewController
    func makeIdentifyViewController() -> IdentifyViewController
    func makeBlockViewController() -> BlockViewController
    
    func makeSettingsNavController() -> UINavigationController
    func makeIdentifyNavController() -> UINavigationController
    func makeBlockNavController() -> UINavigationController
    
    func makeCallerTableViewController(collection: CallerCollection) -> CallersTableViewController
    func makeAddCallerToBlockViewController() -> AddCallerViewController
    func makeAddCallerToIdentifyViewController() -> AddCallerViewController
}
