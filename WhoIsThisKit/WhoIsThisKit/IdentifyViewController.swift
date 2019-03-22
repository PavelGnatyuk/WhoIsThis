//
//  IdentifyViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit

class IdentifyViewController: UIViewController {

    let viewModel: IdentifyViewModel
    
    init(viewModel: IdentifyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = viewModel.title
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    lazy var identifyView: IdentifyView = {
        let view = IdentifyView()
        return view
    }()

    override func loadView() {
        view = identifyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
