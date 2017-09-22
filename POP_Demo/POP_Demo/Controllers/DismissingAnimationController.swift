//
//  DismissingAnimationController.swift
//  POP_Demo
//
//  Created by XH-LWR on 2017/9/21.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit
import pop

class DismissingAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toView = transitionContext.viewController(forKey: .to)?.view
        toView?.tintAdjustmentMode = .normal
        toView?.isUserInteractionEnabled = true
        
        let fromView = transitionContext.viewController(forKey: .from)?.view
        
        let closeAnimation = POPBasicAnimation(propertyNamed: kPOPLayerPositionY)
        closeAnimation?.toValue = (fromView?.layer.position.y)! * -1
        closeAnimation?.completionBlock = { (anim: POPAnimation?, finished: Bool) in
            
            transitionContext.completeTransition(true)
        }
        
        let scaleDownAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleDownAnimation?.springBounciness = 20
        scaleDownAnimation?.toValue = NSValue.init(cgPoint: CGPoint(x: 0, y: 0))
        
        fromView?.layer.pop_add(closeAnimation, forKey: "closeAnimation")
        fromView?.layer.pop_add(scaleDownAnimation, forKey: "scaleDown")
    }
}
