//
//  RuntimeViewController.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/24.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class RuntimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tapedBtn(sender: AnyObject) {
        print("taped original method")
    }
}
