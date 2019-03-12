//
//  MainViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 12/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTool

public class FlowViewController: UIViewController {
    
    lazy var viewControllerFactory: ViewControllerFactoring = {
        return ViewControllerFactory()
    }()
    
    lazy var tabBar: UITabBarController = {
        return viewControllerFactory.makeTabBarController()
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
    
        // Function `add` is located in a `UIViewController` extension from the TheTool static library.
        add(child: tabBar)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
