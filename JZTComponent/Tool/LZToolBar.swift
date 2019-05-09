//
//  LZToolBar.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/23.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

@IBDesignable
public class LZToolBar: SpringView {
    private var effectView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.isHidden = true
        return view
    }()
    private let backgroundImageView = UIImageView()
    
    public let safeAreaView = UIImageView()
    public var didTouchToolbar: (() -> Void)?
    
    override public var backgroundColor: UIColor?  {
        didSet{
            backgroundImageView.backgroundColor = backgroundColor
        }
    }
    
    @IBInspectable public var translucent = false {
        didSet{
            effectView.isHidden = !translucent
        }
    }
    
    @IBInspectable public var backgroundImage: UIImage? {
        didSet{
            backgroundImageView.image = backgroundImage
        }
    }
    
    @IBInspectable public var effectSyle = UIBlurEffect.Style.extraLight {
        didSet{
            effectView.effect = nil
            effectView.effect = UIBlurEffect(style: effectSyle)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

   
    func commonInit() {
        insertSubview(safeAreaView, at: 0)
        insertSubview(effectView, at: 0)
        insertSubview(backgroundImageView, at: 0)      
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let statusBarH   = UIApplication.shared.statusBarFrame.height
        let safeBottomArea: CGFloat = (statusBarH == 44 ? 34 : 0)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + safeBottomArea)
        safeAreaView.frame = CGRect(x: 0, y: bounds.height, width: bounds.width, height: safeBottomArea)
        effectView.frame = backgroundImageView.frame
    }
}

//MARK: - 交互
public extension LZToolBar {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var touchBound = bounds
        touchBound.size.height = bounds.height + 34.0
        return touchBound.contains(point)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let block = self.didTouchToolbar {
            block()
        }
    }
}
