//
//  AppDelegate.swift
//  sina_blog
//
//  Created by kfz on 16/10/24.
//  Copyright © 2016年 jaly. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = MainTabViewController()
        return true
    }

}

