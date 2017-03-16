//
//  ViewController.swift
//  Quartz-2D
//
//  Created by kfz on 2017/3/16.
//  Copyright © 2017年 kongfz. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var imgView = { () -> UIImageView in 
        let imgV = UIImageView()
        imgV.backgroundColor = UIColor.groupTableViewBackground

        return imgV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addQuartzView_1()
        
        view.addSubview(imgView)
        imgView.image = drawPic()
        imgView.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.width.height.equalTo(100)
        }
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
    func drawPic() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height:100), false, UIScreen.main.scale)
        
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100))
        UIColor.green.setFill()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

























