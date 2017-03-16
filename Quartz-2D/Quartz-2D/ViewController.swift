//
//  ViewController.swift
//  Quartz-2D
//
//  Created by kfz on 2017/3/16.
//  Copyright © 2017年 kongfz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addQuartzView_1()
    }


}

extension ViewController {
    func addQuartzView_1() {
        let rect = CGRect(x: 10, y: 90, width: 200, height: 120)
        let v = TestView()
        v.backgroundColor = UIColor.orange
        v.frame = rect
        view.addSubview(v)
    }
}

