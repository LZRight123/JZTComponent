//
//  ModelCollection.swift
//  Sundell
//
//  Created by 梁泽 on 2019/4/5.
//  Copyright © 2019 梁泽. All rights reserved.
//

import Foundation

public protocol ModelCollection: Collection where Index == Collection.Index {
    associatedtype Model
    associatedtype Collection: Swift.Collection where Collection.Element == Model
    
    var list: Collection { get set }
}

public extension ModelCollection where Index == Collection.Index, Element == Collection.Element
{
    var startIndex: Index { return list.startIndex }
    var endIndex: Index { return list.endIndex }

    func index(after i: Index) -> Index { return list.index(after: i) }
}

public extension ModelCollection where Collection == Array<Model> {
    subscript(_ index: Int) -> Model {
        get { return list[index] }
    }
}



//MARK:- Excample
//struct ModelCollectionExcample: ModelCollection {
//    typealias Model = Product
//    typealias Collection = [Product]
//    typealias Index = Collection.Index
//    typealias Element = Collection.Element
//
//    var list = Collection()
//
//}
//
//struct ModelCollectionExcamleDic: ModelCollection {
//    subscript(index: Index) -> Element {
//        get {
//            return list[index]
//        }
//    }
//
//
//    typealias Model = (key: Category, value: [Product])
//
//    typealias Collection = [Category : [Product]]
//
//    typealias Index = Collection.Index
//
//    typealias Element = Collection.Element
//
//    var list = Collection()
//
//}
