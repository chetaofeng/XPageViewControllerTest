//
//  AppDelegate.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,XPageViewControllerDataSource {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //        let vc1 = ViewController()
        //        let vc2 = ViewController()
        //        let vc3 = ViewController()
        //        let vc4 = ViewController()
        //        let vc5 = ViewController()
        //
        //        vc1.title = "ViewController title1"
        //        vc2.title = "ViewController title2"
        //        vc3.title = "ViewController title3"
        //        vc4.title = "ViewController title4"
        //        vc5.title = "ViewController title5"
        
        let xPageViewController = XPageViewController()
        //        xPageViewController.controllers = [vc1,vc2,vc3,vc4,vc5]
        xPageViewController.xPageDataSource = self
        
        self.window?.rootViewController = UINavigationController(rootViewController: xPageViewController)
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func XPageNumberOfControllers() -> Int {
        return 5
    }
    func XPageControllersTitle(index: Int) -> String {
        return "title\(index)"
    }
    func XPageWillShowController(index: Int) -> UIViewController {
        let vc = ViewController()
        return vc
    }
}

