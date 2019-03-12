//
//  ViewControllerFactory.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 12/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit.UIViewController

protocol ViewControllerFactoring {
    func makeTabBarController() -> UITabBarController
    func makeSettingsViewController() -> SettingsViewController
    func makeCallersViewController() -> CallersViewController
    func makeSettingsNavController() -> UINavigationController
    func makeCallersNavController() -> UINavigationController
}
