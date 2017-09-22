//
//  PresentingAnimationController.swift
//  POP_Demo
//
//  Created by XH-LWR on 2017/9/21.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit
import pop

class PresentingAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.viewController(forKey: .from)?.view
        fromView?.tintAdjustmentMode = .dimmed
        fromView?.isUserInteractionEnabled = false
        
        let toView = transitionContext.viewController(forKey: .to)?.view
        toView?.frame = CGRect(x: 0, y: 0, width: transitionContext.containerView.bounds.maxX - 100, height: transitionContext.containerView.bounds.maxY - 280)
        let p = CGPoint(x: transitionContext.containerView.center.x, y: -transitionContext.containerView.center.y)
        toView?.center = p
        
        transitionContext.containerView.addSubview(toView!)
        
        let positionAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        positionAnimation?.toValue = transitionContext.containerView.center.y
        positionAnimation?.springBounciness = 10
        positionAnimation?.completionBlock = {(anim: POPAnimation?, finished: Bool) -> Void in
            
            transitionContext.completeTransition(true)
        }
        
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation?.springBounciness = 20
        scaleAnimation?.fromValue = NSValue.init(cgPoint: CGPoint(x: 1.2, y: 1.4))
        toView?.layer.pop_add(positionAnimation, forKey: "positionAnimation")
        toView?.layer.pop_add(scaleAnimation, forKey: "scaleAnimation")
    }
}
