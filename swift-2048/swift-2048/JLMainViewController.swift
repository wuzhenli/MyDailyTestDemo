//
//  JLMainViewController.swift
//  swift-2048
//
//  Created by kfz on 16/9/17.
//  Copyright © 2016年 kognfz. All rights reserved.
//

import UIKit

class JLMainViewController: UIViewController {
    var colums: Int = 4
    
    var cellWidth: CGFloat = 50.0
    var cellMargin: CGFloat = 6.0
    
    var maxScore: NSInteger = 2048
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    func initGame() {
        
    }

}








