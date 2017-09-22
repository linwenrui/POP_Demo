//
//  WrongPWDViewController.swift
//  POP_Demo
//
//  Created by XH-LWR on 2017/9/21.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit
import pop

class WrongPWDViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func login() {
        
        let shake = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        shake?.springBounciness = 20
        shake?.velocity = 3000
        textField.layer.pop_add(shake, forKey: "shakePassword")
    }
}
