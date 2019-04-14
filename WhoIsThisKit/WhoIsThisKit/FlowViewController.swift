//
//  MainViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 12/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTheme
import TheTool
import WhoIsThisDB

public class FlowViewController: UIViewController {
    
    let application: UIApplication
    
    lazy var blockedCallers: CallerCollection = {
        var collection = CallerLoader().load()
        return collection
    }()

    lazy var identifiedCallers: CallerCollection = {
        var collection = CallerLoader().load()
        return collection
    }()

    public lazy var theme: Theme = {
        let theme = StandardTheme()
        theme.apply(for: application)
        return theme
    }()

    lazy var viewControllerFactory: ViewControllerFactoring = {
        var factory = ViewControllerFactory(theme: theme, blocked: blockedCallers, identified: identifiedCallers)
        factory.coordinator = self
        return factory
    }()
    
    lazy var tabBar: UITabBarController = {
        return viewControllerFactory.makeTabBarController()
    }()
    
    public init(application: UIApplication) {
        self.application = application
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = theme.main.backgroundColor
    
        // Function `add` is located in a `UIViewController` extension from the TheTool static library.
        add(child: tabBar)
    }
    
}

extension FlowViewController: IdentifyViewControllerDelegate, BlockViewControllerDelegate {
    func onAdd(viewController: UIViewController, viewModel: IdentifyViewModel) {
        let controller = viewControllerFactory.makeAddCallerToIdentifyViewController()
        controller.delegate = self
        viewController.navigationController?.pushViewController(controller, animated: true)
    }

    func onAdd(viewController: UIViewController, viewModel: BlockViewModel) {
        let controller = viewControllerFactory.makeAddCallerToBlockViewController()
        controller.delegate = self
        viewController.navigationController?.pushViewController(controller, animated: true)
    }

}

extension FlowViewController: AddCallerViewControllerDelegate {
    func onClose(viewController: UIViewController, viewModel: CallerViewModel) {
        add(from: viewModel)
        viewController.navigationController?.popViewController(animated: true)        
    }
}

fileprivate extension FlowViewController {
    func add(from viewModel: CallerViewModel) {
        guard viewModel.hasModified else {
            debugPrint("View model not modified")
            return
        }
        
        switch viewModel.type {
        case .blockCaller:
            add(from: viewModel, to: blockedCallers)
            
        default:
            add(from: viewModel, to: identifiedCallers)
        }
    }
    
    func add(from viewModel: CallerViewModel, to collection: CallerCollection) {
        assert(viewModel.hasModified, "Caller view model has not been modified")
        let caller = Caller(name: viewModel.name, phone: viewModel.phone, note: viewModel.note)
        let saver = CallerSaver(collection: collection)
        saver.add(caller: caller)
    }
}
