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

public class FlowViewController: UIViewController {
    
    let application: UIApplication
    
    public lazy var theme: Theme = {
        let theme = StandardTheme()
        theme.apply(for: application)
        return theme
    }()

    lazy var viewControllerFactory: ViewControllerFactoring = {
        var factory = ViewControllerFactory(theme: theme)
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
    func onAdd(viewController: UIViewController) {
        let controller = viewControllerFactory.makeAddCallerToIdentifyViewController()
        controller.delegate = self
        viewController.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension FlowViewController: AddCallerViewControllerDelegate {
    func onClose(viewController: UIViewController, modified: Bool) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
