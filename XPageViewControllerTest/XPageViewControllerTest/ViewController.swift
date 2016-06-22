//
//  ViewController.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let r = arc4random() % 255
        let g = arc4random() % 255
        let b = arc4random() % 255
        
        self.view.backgroundColor = UIColor(colorLiteralRed: r.FloatValue/255, green: g.FloatValue/255, blue: b.FloatValue/255, alpha: 1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

