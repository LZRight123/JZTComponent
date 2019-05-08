//
//  SecondViewController.swift
//  JZTComponentApp
//  
//  Created by ash on 2019/5/8.
//  Copyright © 2019 ash. All rights reserved.
//
    

import UIKit
import JZTComponent

class SecondViewController: UITableViewController {
    
    var dataSource: TableViewDataSource<String, UITableViewCell>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regiseter(nib: UITableViewCell.self)
        let tableViewDatasource = TableViewDataSource(models: [""], cellType: UITableViewCell.self) { (model, cell) in
            
        }
        dataSource = UITableViewCell.makeDataSource(["1", "2"])
        tableView.dataSource = tableViewDatasource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource?[indexPath.row]
        debugPrint(model ?? "")
    }


}


