//
//  AViewController.swift
//  navigationTitle_bug
//
//  Created by kfz on 16/11/12.
//  Copyright © 2016年 kongfz. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "AViewController"
    }

    @IBAction func PushBVC(_ sender: Any) {
        let vc = BViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
