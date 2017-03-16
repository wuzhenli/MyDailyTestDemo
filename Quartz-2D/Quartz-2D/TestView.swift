//
//  TestView.swift
//  Quartz-2D
//
//  Created by kfz on 2017/3/16.
//  Copyright © 2017年 kongfz. All rights reserved.
//

import UIKit
import QuartzCore
import CoreGraphics


class TestView: UIView {

    override func draw(_ rect: CGRect) {
        drawTest_3()
    }
    
    func drawTest_4() {
        
    }
    
    
    func drawTest_3()  {
        let con = UIGraphicsGetCurrentContext()!
        con.move(to: CGPoint(x: 10, y: 10))
        con.addLine(to: CGPoint(x: 100, y: 10))
        con.addLine(to: CGPoint(x: 60, y: 33))
        con.addLine(to: CGPoint(x: 10, y: 10))
        con.setStrokeColor(UIColor.red.cgColor)
        con.setLineWidth(1.2)
        
        con.strokePath()
    }
    
    func drawTest_2() {
        let con = UIGraphicsGetCurrentContext()
        con?.addEllipse(in: CGRect(x: 10, y: 5, width: 59, height: 33))
        con?.setFillColor(UIColor.red.cgColor)
        con?.setStrokeColor(UIColor.green.cgColor)
        
        con?.fillPath()
    }
    
    func drawTest_1() {
        let rect = CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 22.3, height: 22.3))
        let path = UIBezierPath(rect: rect)
        UIColor.blue.setFill()
        path.fill()
    }

}





























