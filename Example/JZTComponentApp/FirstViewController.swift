//
//  FirstViewController.swift
//  JZTComponentApp
//  
//  Created by ash on 2019/5/8.
//  Copyright © 2019 ash. All rights reserved.
//
    

import UIKit
import JZTComponent

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

extension UITableViewCell {
    static func makeDataSource(_ messasges: [String]) -> TableViewDataSource<String, UITableViewCell>? {
        guard messasges.count > 0 else {
            return nil
        }
        return TableViewDataSource<String, UITableViewCell>(models: messasges, cellType:UITableViewCell.self, cellConfigurator: {
            models, type in
        })
    }
}

