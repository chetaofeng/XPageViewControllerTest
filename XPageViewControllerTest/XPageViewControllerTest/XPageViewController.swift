//
//  XPageViewController.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

protocol XPageViewControllerDataSource {
    func XPageNumberOfControllers() -> Int
    func XPageWillShowController(index:Int) -> UIViewController
    func XPageControllersTitle(index:Int) -> String
}

class XPageViewController: UIViewController {
    
    let xPageBar = XPageBar()
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
        self.xScrollView.delegate = self
        self.view.addSubview(self.xScrollView)
        
        self.xPageBar.frame = CGRectMake(0,64,self.screenWidth,44) //64为NavigationBar的高度
        self.xPageBar.xPageBarDelegate = self
        self.view.addSubview(self.xPageBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
