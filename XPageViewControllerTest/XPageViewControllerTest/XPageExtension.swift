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
        for i in 0..<controllers.count {
            let vc = controllers[i]
            vc.view.frame.origin.x = i.CGFloatValue * self.screenWidth
            self.xScrollView.addSubview(vc.view)
            titleArray.append(vc.title!)
        }
        self.xScrollView.contentSize = CGSizeMake(self.screenWidth * controllers.count.CGFloatValue,self.screenHeight)
        self.xPageBar.titleArr = titleArray
    }
}

extension XPageViewController:XPageBarProtocol{
    func xPageBarLabelDidTaped(index:Int) {
        self.xScrollView.setContentOffset(CGPointMake(self.screenWidth * index.CGFloatValue, 0), animated: true)
    }
}

extension XPageViewController:UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / self.screenWidth
        self.xPageBar.seletedItem = index.IntValue
    }
}