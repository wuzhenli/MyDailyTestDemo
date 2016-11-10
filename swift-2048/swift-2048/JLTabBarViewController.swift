//
//  JLTabBarViewController.swift
//  swift-2048
//
//  Created by kfz on 16/9/17.
//  Copyright © 2016年 kognfz. All rights reserved.
//

import UIKit

class JLTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let main = JLMainViewController()
        main.title = "2048"
        main.tabBarItem.title = "2048"
        
        let setting = JLSettingViewController()
        setting.title = "设置"
        setting.tabBarItem.title = "设置"
        
        let manNav = UINavigationController(rootViewController: main)
        let settingNav = UINavigationController(rootViewController: setting)

        self.viewControllers = [manNav, settingNav]
    }
}

