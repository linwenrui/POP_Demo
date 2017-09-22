//
//  CustomModalViewController.swift
//  POP_Demo
//
//  Created by XH-LWR on 2017/9/21.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit

class CustomModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.cornerRadius = 8.0
    }
    
    @IBAction func close() {
        
        dismiss(animated: true, completion: nil)
    }
}
