//
//  ViewController.swift
//  swiftTest
//
//  Created by kfz on 16/11/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a = Address();
        a.town = "chaoyang"
        print(a.city + "--" + a.town!)
        let b = a
        b.town = "changping"
        if a === b {
            print("a==b")
        } else  {
            print("a != b")
        }
    }

    


}


class Address {
    let city = "beijing"
    var town: String?
}
