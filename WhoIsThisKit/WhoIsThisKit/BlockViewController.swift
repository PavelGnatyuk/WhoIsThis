//
//  BlockViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTheme

class BlockViewController: UIViewController {

    let viewModel: BlockViewModel
    let theme: Theme
    let viewControllerFactory: ViewControllerFactoring
    
    lazy var blockView: BlockView = {
        let view = BlockView()
        view.backgroundColor = theme.main.backgroundColor
        return view
    }()

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
    
    init(theme: Theme, viewModel: BlockViewModel, viewControllerFactory: ViewControllerFactoring) {
        self.theme = theme
        self.viewModel = viewModel
        self.viewControllerFactory = viewControllerFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func loadView() {
        view = blockView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButton()
        add(child: tableViewController)
        NSLayoutConstraint.activate(tableViewConstraints)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = viewModel.title
    }
}

fileprivate extension BlockViewController {
    func addBarButton() {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapOnAddButton(_:)))
        navigationItem.rightBarButtonItem = add
    }
    
    @objc func tapOnAddButton(_ sender: AnyObject) {
        let controller = viewControllerFactory.makeAddCallerToBlockViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
