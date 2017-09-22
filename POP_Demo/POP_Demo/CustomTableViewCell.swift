//
//  CustomTableViewCell.swift
//  POP_Demo
//
//  Created by XH-LWR on 2017/9/21.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit
import pop

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func cellReuserIdentifier() -> String {
        
        return "CustomTableViewCell"
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            
            let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
            scaleAnimation?.duration = 0.1
            scaleAnimation?.toValue = NSValue.init(cgPoint: CGPoint(x: 1, y: 1))
            titleLab.pop_add(scaleAnimation, forKey: "scalingUp")
        } else {
            
            let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            sprintAnimation?.toValue = NSValue.init(cgPoint: CGPoint(x: 0.9, y: 0.9))
            sprintAnimation?.velocity = NSValue.init(cgPoint: CGPoint(x: 2, y: 2))
            sprintAnimation?.springBounciness = 20.0
            titleLab.pop_add(sprintAnimation, forKey: "springAnimation")
        }
    }
}
