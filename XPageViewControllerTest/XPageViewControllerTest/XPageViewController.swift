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
    var contentScrollView:UIScrollView!
    var numberOfControllers:Int!
    var hasInitControllerTag:Dictionary<Int,Bool> = [:]
    var xPageDataSource:XPageViewControllerDataSource! {
        didSet{
            self.numberOfControllers = self.xPageDataSource.XPageNumberOfControllers()
            self.addViewToSelf()
        }
    }
  
    init(){
        super.init(nibName: nil, bundle: nil)
        
        self.contentScrollView = UIScrollView(frame: self.view.frame)
        self.contentScrollView.showsHorizontalScrollIndicator = false
        self.contentScrollView.showsVerticalScrollIndicator = false
        self.contentScrollView.pagingEnabled = true
        self.contentScrollView.delegate = self
        self.view.addSubview(self.contentScrollView)
        
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
