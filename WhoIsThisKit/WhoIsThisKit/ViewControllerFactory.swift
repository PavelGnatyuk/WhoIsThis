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
        let identify = makeIdentifyNavController()
        let block = makeBlockNavController()
        let settings = makeSettingsNavController()
        controller.setViewControllers([block, identify, settings], animated: false)
        return controller
    }
    
    func makeSettingsViewController() -> SettingsViewController {
        let viewModel = SettingsViewModel()
        let controller = SettingsViewController(viewModel: viewModel)
        return controller
    }
    
    func makeIdentifyViewController() -> IdentifyViewController {
        let viewModel = IdentifyViewModel()
        let controller = IdentifyViewController(theme: theme, viewModel: viewModel, viewControllerFactory: self)
        return controller
    }
    
    func makeBlockViewController() -> BlockViewController {
        let callers = CallerLoader().load()
        let viewModel = BlockViewModel(callers: callers)
        let controller = BlockViewController(theme: theme, viewModel: viewModel, viewControllerFactory: self)
        return controller
    }
    
    func makeSettingsNavController() -> UINavigationController {
        let controller = makeSettingsViewController()
        let navController = makeNavController(rootViewController: controller)
        navController.tabBarItem = UITabBarItem(title: .tabBarItemSettings, image: nil, selectedImage: nil)
        return navController
    }
    
    func makeIdentifyNavController() -> UINavigationController {
        let controller = makeIdentifyViewController()
        let navController = makeNavController(rootViewController: controller)
        navController.tabBarItem = UITabBarItem(title: .tabBarItemIdentify, image: nil, selectedImage: nil)
        return navController
    }

    func makeBlockNavController() -> UINavigationController {
        let controller = makeBlockViewController()
        let navController = makeNavController(rootViewController: controller)
        navController.tabBarItem = UITabBarItem(title: .tabBarItemBlock, image: nil, selectedImage: nil)
        return navController
    }

    func makeCallerTableViewController() -> CallersTableViewController {
        let dataSource = CallerTableViewDataSource()
        let controller = CallersTableViewController(theme: theme, dataSource: dataSource)
        return controller
    }
    
    func makeAddCallerToBlockViewController() -> AddCallerViewController {
        let viewModel = AddCallerViewModelType.make(type: .blockCaller)
        let controller = AddCallerViewController(viewModel: viewModel, theme: theme)
        return controller
    }
    
    func makeAddCallerToIdentifyViewController() -> AddCallerViewController {
        let viewModel = AddCallerViewModelType.make(type: .identifyCaller)
        let controller = AddCallerViewController(viewModel: viewModel, theme: theme)
        return controller
    }
}

fileprivate extension ViewControllerFactory {
    func makeNavController(rootViewController: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}

fileprivate extension String {
    static let tabBarItemIdentify = "Identify"
    static let tabBarItemBlock = "Block"
    static let tabBarItemSettings = "Settings"
}
