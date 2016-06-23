//
//  XPageExtension.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import Foundation
import UIKit

extension XPageViewController {
    func addViewToSelf(){
        var titleArray:Array<String> = []
        for i in 0..<self.numberOfControllers {
//            let vc = self.xPageDataSource.XPageWillShowController(i)
//            vc.view.frame.origin.x = i.CGFloatValue * self.screenWidth
//            self.contentScrollView.addSubview(vc.view)
            titleArray.append(self.xPageDataSource.XPageControllersTitle(i))
        }
        self.contentScrollView.contentSize = CGSizeMake(self.screenWidth * self.numberOfControllers.CGFloatValue,self.screenHeight)
        self.xPageBar.titleArr = titleArray
        self.addControllerToContentScrollView(0)
        self.addControllerToContentScrollView(1)
    }
    
    func addControllerToContentScrollView(index:Int) {
        if self.hasInitControllerTag[index] == nil && index >= 0 && index < self.numberOfControllers {
            self.hasInitControllerTag[index] = true
            let vc = self.xPageDataSource.XPageWillShowController(index)
            self.addChildViewController(vc)
            vc.view.frame.origin.x = self.screenWidth * index.CGFloatValue
            self.contentScrollView.addSubview(vc.view)
        }
    }
}

extension XPageViewController:XPageBarProtocol{
    func xPageBarLabelDidTaped(index:Int) {
        self.contentScrollView.setContentOffset(CGPointMake(self.screenWidth * index.CGFloatValue, 0), animated: true)
        self.addControllerToContentScrollView(index)
        self.addControllerToContentScrollView(index - 1)
        self.addControllerToContentScrollView(index + 1)
    }
}

extension XPageViewController:UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / self.screenWidth
        self.xPageBar.seletedItem = index.IntValue
        
        self.addControllerToContentScrollView(index.IntValue)
        self.addControllerToContentScrollView(index.IntValue - 1)
        self.addControllerToContentScrollView(index.IntValue + 1)
    }
}