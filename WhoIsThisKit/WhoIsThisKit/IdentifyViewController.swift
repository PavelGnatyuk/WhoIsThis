//
//  IdentifyViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTheme

class IdentifyViewController: UIViewController {

    let viewModel: IdentifyViewModel
    let theme: Theme
    let viewControllerFactory: ViewControllerFactoring

    lazy var tableViewController: CallersTableViewController = {
        let controller = viewControllerFactory.makeCallerTableViewController()
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    var tableViewConstraints: [NSLayoutConstraint] {
        return [
            tableViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
    }

    init(theme: Theme, viewModel: IdentifyViewModel, viewControllerFactory: ViewControllerFactoring) {
        self.theme = theme
        self.viewModel = viewModel
        self.viewControllerFactory = viewControllerFactory
        super.init(nibName: nil, bundle: nil)
        title = viewModel.title
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    lazy var identifyView: IdentifyView = {
        let view = IdentifyView()
        view.backgroundColor = theme.main.backgroundColor
        return view
    }()

    override func loadView() {
        view = identifyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButton()
        add(child: tableViewController)
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

fileprivate extension IdentifyViewController {
    func addBarButton() {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapOnAddButton(_:)))
        navigationItem.rightBarButtonItem = add
    }
    
    @objc func tapOnAddButton(_ sender: AnyObject) {
        let controller = viewControllerFactory.makeAddCallerToIdentifyViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
