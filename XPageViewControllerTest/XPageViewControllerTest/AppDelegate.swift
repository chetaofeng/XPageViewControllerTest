//
//  AppDelegate.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let vc1 = ViewController()
        let vc2 = ViewController()
        let vc3 = ViewController()
        let vc4 = ViewController()
        let vc5 = ViewController()
        
        let xPageViewController = XPageViewController()
        xPageViewController.controllers = [vc1,vc2,vc3,vc4,vc5]
        
        self.window?.rootViewController = xPageViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

