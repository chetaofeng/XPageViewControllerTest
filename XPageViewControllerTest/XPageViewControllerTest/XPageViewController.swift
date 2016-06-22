//
//  XPageViewController.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class XPageViewController: UIViewController {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    var xScrollView:UIScrollView!
    var controllers:Array<UIViewController> = []{
        didSet{
            print("Controllers didSet")
            
            self.addViewToSelf()
        }
    }

    init(){
        super.init(nibName: nil, bundle: nil)
        
        self.xScrollView = UIScrollView(frame: self.view.frame)
        self.xScrollView.showsHorizontalScrollIndicator = false
        self.xScrollView.showsVerticalScrollIndicator = false
        self.xScrollView.pagingEnabled = true
        self.view.addSubview(self.xScrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
