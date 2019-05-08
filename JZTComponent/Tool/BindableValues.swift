//
//  BindableValues.swift
//  Sundell
//
//  Created by 梁泽 on 2019/4/6.
//  Copyright © 2019 梁泽. All rights reserved.
//

import Foundation
// 例子：
// -> 1,传入要观察的sourceKey,目标对像targetObject，targetObject的属性objectKey，closure就是一个简单的赋值
// -> addObservation 如果有lastValue 马上执行 handler， 并把hanlder这个放入一个新的 (Value) -> Bool 闭包 加到observations数组中 这
// -> update刷新lastValue，并执行observations中所有为true的closure
//class ExcampleVC: UIViewController {
//    private let user = Bindable<User>()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        addNameLabel()
//    }
//
//    func userUpdate() { user.update(with: User()) }
//
//    func addNameLabel() {
//        let label = UILabel()
//        user.bind( \.name , to: label, \.text)
//        view.addSubview(label)
//    }
//}

open class Bindable<Value> {
    private var observations = [(Value) -> Bool]()
    private var lastValue: Value?
    
    public init(_ value: Value? = nil) {
        lastValue = value
    }
}
//MARK:- addObservation
public extension Bindable {
    func addObservation<O: AnyObject>(for object: O, handler: @escaping (O, Value) -> Void) {
        lastValue.map{ handler(object, $0) }
        
        observations.append { [weak object] value in
            guard let object = object else { return false }
            
            handler(object, value)
            return true
        }
    }
}
//MARK:- update value
public extension Bindable {
    func update(with value: Value) {
        lastValue = value
        observations = observations.filter{ $0(value) }
    }
}
//binding
public extension Bindable {
    func bind<O: AnyObject, T>(_ sourceKeyPath: KeyPath<Value, T>, to object: O, _ objectKeyPath: ReferenceWritableKeyPath<O, T>
        ) {
        addObservation(for: object) { object, observed in
            let value = observed[keyPath: sourceKeyPath]
            object[keyPath: objectKeyPath] = value
        }
    }
    
    func bind<O: AnyObject, T>(_ sourceKeyPath: KeyPath<Value, T>, to object: O, _ objectKeyPath: ReferenceWritableKeyPath<O, T?>) {
        addObservation(for: object) { (object, observed) in
            let value = observed[keyPath: sourceKeyPath]
            object[keyPath: objectKeyPath] = value
        }
    }
    
    public func bind<O: AnyObject, T, R>(_ sourceKeyPath: KeyPath<Value, T>, to object: O, _ objectKeyPath: ReferenceWritableKeyPath<O, R?>, transform: @escaping (T) -> R?
        ) {
        addObservation(for: object) { object, observed in
            let value = observed[keyPath: sourceKeyPath]
            let transformed = transform(value)
            object[keyPath: objectKeyPath] = transformed
        }
    }
}
