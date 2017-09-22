//
//  LikeSendViewController.swift
//  POP_Demo
//
//  Created by XH-LWR on 2017/9/21.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit
import pop

class LikeSendViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var sendLab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func showLikeImg() {
        
        likeImg.isHidden = false
        sendLab.isHidden = true
        
        let spin = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
        spin?.fromValue = Double.pi / 4
        spin?.toValue = 0
        spin?.springBounciness = 20.0
        spin?.velocity = 10
        likeImg.layer.pop_add(spin, forKey: "likeAnimation")
    }

    func showSendLab() {
        
        if sendLab.isHidden {
            
            likeImg.isHidden = true
            sendLab.isHidden = false
            let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            sprintAnimation?.velocity = NSValue(cgPoint: CGPoint(x: 8, y: 8))
            sprintAnimation?.springBounciness = 20.0
            sendLab.pop_add(sprintAnimation, forKey: "sendAnimation")
        }
    }
}

extension LikeSendViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var comment = ""
        if range.length == 0 {
            
            comment = string
        } else {
            
            comment = (textField.text! as NSString).substring(to: (textField.text?.characters.count)! - range.length)
        }
        if comment.characters.count == 0 {
            
            showLikeImg()
        } else {
            
            showSendLab()
        }
        return true
    }
}
