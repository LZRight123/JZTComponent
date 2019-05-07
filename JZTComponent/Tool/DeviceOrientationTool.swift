//
//  DeviceOrientationTool.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/24.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

public class DeviceOrientationTool: NSObject {
    @objc static var allowRotation = false

    @objc static func chooseNewOrientation(_ orientation: UIInterfaceOrientation) {
        switch orientation {
        case .landscapeRight, .landscapeLeft:
            allowRotation = true
        default:
            allowRotation = false
        }
        
        UIDevice.current.setValue((UIInterfaceOrientation.unknown.rawValue as NSNumber), forKey: "orientation")
        UIDevice.current.setValue((orientation.rawValue as NSNumber), forKey: "orientation")
    }
}
