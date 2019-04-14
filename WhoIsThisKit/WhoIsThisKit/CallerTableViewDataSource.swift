//
//  CallerTableViewDataSource.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import WhoIsThisDB

class CallerTableViewDataSource: NSObject, UITableViewDataSource {
    
    let collection: CallerCollection
    
    init(collection: CallerCollection) {
        self.collection = collection
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("Collection: \(collection). Count: \(collection.count)")
        return collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = collection[indexPath.row]
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: CallerTableViewCell.reuseIdentifier)
        cell.backgroundColor = .clear
        cell.textLabel?.text = item.name
        return cell
    }
    
}
