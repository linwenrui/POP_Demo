//
//  TranitionViewController.swift
//  POP_Demo
//
//  Created by XH-LWR on 2017/9/21.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit

class TranitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func present() {
        
        let modalVC = CustomModalViewController()
        modalVC.transitioningDelegate = self
        modalVC.modalPresentationStyle = .custom
        navigationController?.present(modalVC, animated: true, completion: nil)
    }
}

extension TranitionViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return PresentingAnimationController() as? UIViewControllerAnimatedTransitioning
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return DismissingAnimationController()
    }
}
