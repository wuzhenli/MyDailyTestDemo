//
//  ViewController.swift
//  navigationTitle_bug
//
//  Created by kfz on 16/11/12.
//  Copyright © 2016年 kongfz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func pushToAVC(_ sender: Any) {
        let avc = AViewController()
        navigationController?.pushViewController(avc, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }


}

