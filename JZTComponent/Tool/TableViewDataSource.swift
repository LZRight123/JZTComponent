//
//  TableViewDataSource.swift
//  Sundell
//
//  Created by 梁泽 on 2019/4/30.
//  Copyright © 2019 梁泽. All rights reserved.
//

import UIKit

public class TableViewDataSource<Model, T: UITableViewCell>: NSObject, UITableViewDataSource {
    typealias CellConfigurator = (Model, T) -> Void
    
    private var models: [Model]
    private let cellType: T.Type
    private let cellConfigurator: CellConfigurator
    
    init(models: [Model],
         cellType: T.Type,
         cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.cellType = cellType
        self.cellConfigurator = cellConfigurator
    }
    
    subscript(_ index: Int) -> Model {
        get { return models[index] }
    }
    
    var count: Int { return models.count }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = cellType.dequeueReusable(for: tableView, for: indexPath)
        cellConfigurator(model, cell)
        return cell
    }
}


public class SectionedTableViewDataSource: NSObject, UITableViewDataSource {
    private let dataSources: [UITableViewDataSource]
    
    init(dataSources: [UITableViewDataSource]) {
        self.dataSources = dataSources
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataSources.count
    }
    
    public func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let dataSource = dataSources[section]
        return dataSource.tableView(tableView, numberOfRowsInSection: 0)
    }
    
    public func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataSource = dataSources[indexPath.section]
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        return dataSource.tableView(tableView, cellForRowAt: indexPath)
    }
}

