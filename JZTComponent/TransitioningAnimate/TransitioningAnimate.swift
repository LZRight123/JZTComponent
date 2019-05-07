//
//  LZTransitioningAnimate.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/24.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit



open class TransitioningAnimate: NSObject {
    @objc var duration: TimeInterval = 0.25
    @objc static var backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    
    static let present = TransitioningAnimatePresent()
    static let presentNoBackground = TransitioningAnimateNoBackgroundPresent()
    static let popup  =  TransitioningAnimatePopup()
}

//MARK: UIViewControllerTransitioningDelegate
extension TransitioningAnimate: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return LZPresentationControlller(presentedViewController: presented, presenting: presenting)
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

//MARK: UIViewControllerAnimatedTransitioning
extension TransitioningAnimate: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //FIXME: -subclass implement
    }
}


class LZPresentationControlller: UIPresentationController {
    private lazy var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = TransitioningAnimate.backgroundColor
        return view
    }()
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView?.frame ?? UIScreen.main.bounds
        containerView?.addSubview(dimmingView)
        dimmingView.addSubview(presentedViewController.view)
        
        let transitionCoordinator = presentedViewController.transitionCoordinator
        dimmingView.alpha = 0
        transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1
        }, completion: nil)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed  {
            dimmingView.removeFromSuperview()
        }
    }
}
