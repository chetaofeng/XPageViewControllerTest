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
        for i in 0..<controllers.count {
            let vc = controllers[i]
            vc.view.frame.origin.x = i.CGFloatValue * self.screenWidth
            self.xScrollView.addSubview(vc.view)
        }
        self.xScrollView.contentSize = CGSizeMake(self.screenWidth * controllers.count.CGFloatValue,self.screenHeight)
    }
}
