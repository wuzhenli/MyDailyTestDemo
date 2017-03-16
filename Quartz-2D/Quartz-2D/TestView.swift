//
//  TestView.swift
//  Quartz-2D
//
//  Created by kfz on 2017/3/16.
//  Copyright © 2017年 kongfz. All rights reserved.
//

import UIKit

class TestView: UIView {

    override func draw(_ rect: CGRect) {
        drawTest_1()
    }
    
    func drawTest_1() {
        let rect = CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 22.3, height: 22.3))
        let path = UIBezierPath(rect: rect)
        UIColor.blue.setFill()
        path.fill()
    }

}





























