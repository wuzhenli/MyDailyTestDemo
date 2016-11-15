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
        a.num = 123
    }

    func test()  {
        let t = TimeTable(multiplier: 2)
        let p = Point(fromPointX: 2, 3)
        
        
    }


}

struct Point {
    var x = 2.0, y = 3.0
    let z: Double
    init(fromPointX pointX: Double,_ pointY: Double ) {
        x = pointX
        y = pointY
        z = pointX
    }
}

struct TimeTable {
    let multiplier: Int
    subscript(index: Int) -> Int {      // 用来表示传入整数的乘法
        return multiplier * index
    }                                   // 省略set,下标定义为只读的
}



class Address {
    let city = "beijing"
    var town: String?
    
    var num: Int = 0 {
        willSet {
            print(newValue)
        }
        didSet(n) {
            print( n)
        }
    }
}














