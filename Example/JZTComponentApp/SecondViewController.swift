//
//  SecondViewController.swift
//  JZTComponentApp
//  
//  Created by ash on 2019/5/8.
//  Copyright © 2019 ash. All rights reserved.
//
    

import UIKit

class SecondViewController: UIViewController {

    var dataSource: TableViewDataSource<String, TableViewCell>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regiseter(nib: TableViewCell.self)
        let tableViewDatasource = TableViewDataSource(models: [""], cellType: TableViewCell.self) { (model, cell) in
            
        }
        dataSource = TableViewCell.makeDataSource(for: ["1", "2"])
        tableView.dataSource = tableViewDatasource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource?[indexPath.row]
        
    }


}


