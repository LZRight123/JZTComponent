//
//  GlobalParameter.swift
//  LearningSwift
//
//  Created by 梁泽 on 2018/9/14.
//  Copyright © 2018年 梁泽. All rights reserved.
//

import UIKit

public let ScreenWidth = UIScreen.main.bounds.width
public let ScreenHeight = UIScreen.main.bounds.height
public let StatusBarH   = UIApplication.shared.statusBarFrame.height
public let ISIphoneX  = (StatusBarH == 44)
public let SafeBottomArea: CGFloat = (ISIphoneX ? 34 : 0)
public let ScaleW = ScreenWidth / 375.0
