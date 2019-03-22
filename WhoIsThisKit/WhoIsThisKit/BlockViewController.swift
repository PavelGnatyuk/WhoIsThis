//
//  BlockViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {

    let viewModel: BlockViewModel
    
    lazy var blockView: BlockView = {
        let view = BlockView()
        return view
    }()

    init(viewModel: BlockViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = viewModel.title
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
    }

}
