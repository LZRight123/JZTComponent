//
//  QuickUI.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/25.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

public extension UIView {
    static func create(color: UIColor = .white) -> UIView {
        return UIView(color: color)
    }
    
    convenience init(color: UIColor){
        self.init()
        self.backgroundColor = color
    }
    
    func addSubviews(_ subViews: UIView...) {
        subViews.forEach(addSubview)
    }
}

public extension CALayer {
    convenience init(color: UIColor = .white){
        self.init()
        backgroundColor = color.cgColor
    }
}

public extension UILabel {
    convenience init(font: UIFont = .font14, textColor: UIColor = .hex222222, text: String? = "", numberOfLines: Int = 1) {
        self.init()
        self.font = font
        self.textColor = textColor
        self.text = text
        self.numberOfLines = numberOfLines
    }
}


public extension UIButton {
    convenience init(font: UIFont, title: String, titleColor: UIColor, image: UIImage? = nil) {
        self.init()
        titleLabel?.font = font
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setImage(image, for: .normal)
    }
}


public extension UITableView {
    convenience init(style: UITableView.Style = .plain, backgroundColor: UIColor = .beijinghui, separatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.init(frame: .zero, style: style)
        self.backgroundColor = backgroundColor
        estimatedRowHeight = 99.9
        estimatedSectionHeaderHeight = 0
        estimatedSectionFooterHeight = 0
        self.separatorStyle = separatorStyle
        separatorColor = .fengeXian
        keyboardDismissMode = .onDrag
    }
}

public extension UICollectionView {
    convenience init(scrollDirection: UICollectionView.ScrollDirection, userInteractionEnabled: Bool = true, backgroundColor: UIColor = .clear ,interitemSpacing: CGFloat = 0.0, lineSpacing: CGFloat = 0.0) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = interitemSpacing
        layout.minimumLineSpacing = lineSpacing
        layout.scrollDirection = scrollDirection
        self.init(frame: .zero, collectionViewLayout: layout)
        scrollsToTop = false
        isUserInteractionEnabled = userInteractionEnabled
        self.backgroundColor = backgroundColor
    }
}
