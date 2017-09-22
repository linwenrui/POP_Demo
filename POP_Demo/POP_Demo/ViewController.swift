//
//  ViewController.swift
//  POP_Demo
//
//  Created by XH-LWR on 2017/9/21.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    let dataSource = ["Facebook Liek & Send", "Wrong Password", "Custom VC Trasition"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return dataSource.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellReuserIdentifier(), for: indexPath) as! CustomTableViewCell
        cell.titleLab.text = dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch dataSource[indexPath.row] {
            
        case "Facebook Liek & Send":
            
            let likeVC = LikeSendViewController()
            likeVC.title = dataSource[indexPath.row]
            navigationController?.pushViewController(likeVC, animated: true)
        case "Wrong Password":
            
            let wrongVC = WrongPWDViewController()
            wrongVC.title = dataSource[indexPath.row]
            navigationController?.pushViewController(wrongVC, animated: true)
        case "Custom VC Trasition":
            
            let transitionVC = TranitionViewController()
            transitionVC.title = dataSource[indexPath.row]
            navigationController?.pushViewController(transitionVC, animated: true)
        default:
            
            print("nothing")
        }
    }
}
