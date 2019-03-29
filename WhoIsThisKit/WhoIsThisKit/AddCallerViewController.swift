//
//  AddCallerViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 24/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTheme

class AddCallerViewController: UIViewController {

    let theme: Theme
    let viewModel: AddCallerViewModel

    lazy var addCallerView: AddCallerView = {
        let view = AddCallerView()
        view.backgroundColor = theme.main.backgroundColor
        return view
    }()
    
    init(viewModel: AddCallerViewModel, theme: Theme) {
        self.viewModel = viewModel
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func loadView() {
        view = addCallerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButtons()
    }
    
}

fileprivate extension AddCallerViewController {
    func addBarButtons() {
        
    }
}
