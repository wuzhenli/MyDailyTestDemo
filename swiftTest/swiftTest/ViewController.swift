//
//  ViewController.swift
//  swiftTest
//
//  Created by kfz on 16/11/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var greenView: GreenView?
    
    lazy var pushBVCBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.yellow
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("push BVC", for: .normal)
        btn.addTarget(self, action: #selector(presentBVC), for: .touchUpInside)
        weak var ws: ViewController! = self
        ws.view.addSubview(btn)
        btn.snp.makeConstraints({ (make)
            in
            make.left.equalTo(ws.view).offset(15)
            make.right.equalTo(ws.view).offset(-15)
            make.bottom.equalTo(ws.view).offset(-15)
        })
        return btn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGreenView()
        view.addSubview(pushBVCBtn)
    }
    
    func addGreenView() {
        let greenV = GreenView()
        greenView = greenV
        greenV.frame = CGRect(origin: CGPoint(x: 10, y: 60), size: CGSize(width: 100, height: 100))
        self.view.addSubview(greenV)
    }
    
    func presentBVC() -> Void {
        let bVC = BViewController()
        bVC.view.backgroundColor = UIColor.orange
        navigationController?.pushViewController(bVC, animated: true)
    }
    


}



















