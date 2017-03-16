//
//  GreenView.swift
//  swiftTest
//
//  Created by kfz on 2017/3/15.
//  Copyright © 2017年 kongfz. All rights reserved.
//

import UIKit

class GreenView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
