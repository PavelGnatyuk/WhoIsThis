//
//  ViewControllerFactory.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 12/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTheme

struct ViewControllerFactory: ViewControllerFactoring {
    let theme: Theme
    
    init(theme: Theme) {
        self.theme = theme
    }
    
    func makeTabBarController() -> UITabBarController {
        let controller = UITabBarController()
        let callers = makeCallersNavController()
        let settings = makeSettingsNavController()
        controller.setViewControllers([callers, settings], animated: false)
        return controller
    }
    
    func makeSettingsViewController() -> SettingsViewController {
        let viewModel = SettingsViewModel()
        let controller = SettingsViewController(viewModel: viewModel)
        return controller
    }
    
    func makeCallersViewController() -> CallersViewController {
        let viewModel = CallersViewModel()
        let controller = CallersViewController(viewModel: viewModel)
        return controller
    }

    func makeSettingsNavController() -> UINavigationController {
        let controller = makeSettingsViewController()
        let navController = UINavigationController(rootViewController: controller)
        navController.tabBarItem = UITabBarItem(title: .tabBarItemSettings, image: nil, selectedImage: nil)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
    
    func makeCallersNavController() -> UINavigationController {
        let controller = makeCallersViewController()
        let navController = UINavigationController(rootViewController: controller)
        navController.tabBarItem = UITabBarItem(title: .tabBarItemCallers, image: nil, selectedImage: nil)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}

fileprivate extension String {
    static let tabBarItemCallers = "Callers"
    static let tabBarItemSettings = "Settings"
}
