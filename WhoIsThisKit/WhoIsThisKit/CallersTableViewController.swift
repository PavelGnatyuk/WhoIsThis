//
//  CallersTableViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTheme

class CallersTableViewController: UIViewController {

    let theme: Theme
    let dataSource: CallerTableViewDataSource
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = dataSource
        table.backgroundColor = theme.tableView.backgroundColor
        table.register(CallerTableViewCell.self, forCellReuseIdentifier: CallerTableViewCell.reuseIdentifier)
        return table
    }()
    
    var tableViewLayout: [NSLayoutConstraint] {
        return [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
    }
    
    init(theme: Theme, dataSource: CallerTableViewDataSource) {
        self.theme = theme
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = theme.main.backgroundColor
        view.addSubview(tableView)
        NSLayoutConstraint.activate(tableViewLayout)
    }
    
}

extension CallersTableViewController: UITableViewDelegate {
    
}
