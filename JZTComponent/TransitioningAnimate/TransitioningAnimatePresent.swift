//
//  LZNormalTransitioningAnimate.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/23.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

open class TransitioningAnimatePresent: TransitioningAnimate
{
    override public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        if transitionContext.viewController(forKey: .to)?.isBeingPresented == true {
            let toView   = transitionContext.view(forKey: .to)!
            toView.transform = CGAffineTransform(translationX: 0, y: containerView.bounds.size.height)
            UIView.animate(withDuration: self.duration, animations: {
                toView.transform = CGAffineTransform.identity
            }) { (_) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: self.duration, animations: {
                fromView?.transform = CGAffineTransform(translationX: 0, y: containerView.bounds.size.height)
            }) { (_) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}

open class TransitioningAnimateNoBackgroundPresent: TransitioningAnimatePresent {
    override public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return UIPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
