//
//  ViewController.swift
//  swift-2048
//
//  Created by kfz on 16/9/15.
//  Copyright © 2016年 kognfz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func starGAME(sender: UIButton) {
        let alert = UIAlertController(title: "开始", message: "准备好了吗？", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "开始游戏 ", style: UIAlertActionStyle.Default, handler: {
            action in
            self .presentViewController(JLTabBarViewController(), animated: true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    

}

