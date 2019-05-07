//
//  LZCache.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2019/1/11.
//  Copyright © 2019 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

public class LZCache: NSObject {
    @objc static let visitRecordDB = LZCache(direcotryName: "JZT_VisitRecord")
    
    private let direcotryName: String
    private let direcotryType: FileManager.SearchPathDirectory
    private var directory: URL {
        return createDirectory(directoryName: direcotryName)
    }
    init(direcotryName: String, direcotryType: FileManager.SearchPathDirectory = .cachesDirectory) {
        self.direcotryName = direcotryName
        self.direcotryType = direcotryType
        super.init()
    }
    
    @discardableResult
    @objc func save(_ obj: NSCoding, for key: String) -> Bool {
        let filePath = directory.appendingPathComponent(key).path
        return NSKeyedArchiver.archiveRootObject(obj, toFile: filePath)
    }
    
    @objc func getCahche(for key: String) -> NSCoding? {
        let filePath = directory.appendingPathComponent(key).path
        let result = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? NSCoding
        return result
    }
    
    @objc func remove(_ key: String) {
        let filePath = directory.appendingPathComponent(key).path
        removeFile(path: filePath)
    }
    
    @objc func clearAllCache() {
        removeFile(path: directory.path)
    }
}


//MARK:- help method
func createDirectory(directoryName: String, for target: FileManager.SearchPathDirectory = .cachesDirectory) -> URL{
    let urlDir = FileManager.default.urls(for: target, in: .userDomainMask).first!
    let directryPath = urlDir.appendingPathComponent(directoryName)
    do {
        try FileManager.default.createDirectory(at: directryPath, withIntermediateDirectories: false, attributes: nil)
        return directryPath
    } catch  {
        return directryPath
    }
}

func removeFile(path: String) {
    if FileManager.default.fileExists(atPath: path) {
        try? FileManager.default.removeItem(atPath: path)
    }
}
