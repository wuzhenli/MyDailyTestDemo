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



class TestView: UIView { //  200 * 220

    override func draw(_ rect: CGRect) {
        draw_Text()
        
    }
    
    func draw_Text() {
        let str: NSString = "这是要现实的文本Text。。。。"
        let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
        
        let atts = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 18),
            NSForegroundColorAttributeName : UIColor.red
        ]
        
        str.draw(in: rect, withAttributes: atts)
        
    }
    
    func draw_Rect() {
        let con = UIGraphicsGetCurrentContext()
        con?.addRect(CGRect(x: 10, y: 10, width: 180, height: 24))
        con?.setStrokeColor(UIColor.green.cgColor)
        con?.setFillColor(UIColor.blue.cgColor)
        con?.setLineWidth(6)
        con?.strokePath()
    }
    
    func draw_Line() {
        let con = UIGraphicsGetCurrentContext()!
        con.move(to: CGPoint(x: 10, y: 10))
        con.addLine(to: CGPoint(x: 60, y:45))
        con.addLine(to: CGPoint(x: 100 ,y:10))
        con.setStrokeColor(UIColor.black.cgColor)
        con.setLineWidth(3)
        con.setLineCap(.butt)
        con.setLineJoin(.bevel)
        con.strokePath()
        con.saveGState()
        // line another
        con.move(to: CGPoint(x:22, y:10))
        con.addLine(to: CGPoint(x:120, y:120))
        con.setStrokeColor(UIColor.red.cgColor)
        con.setLineWidth(6)
        con.strokePath()
        
        con.saveGState()
        con.restoreGState()
        con.restoreGState()
        // line three
        con.move(to: CGPoint(x:100, y:0))
        con.addLine(to: CGPoint(x:10 ,y:122))
        con.strokePath()
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





























