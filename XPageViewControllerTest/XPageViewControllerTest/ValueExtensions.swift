//
//  ValueExtensions.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

extension UInt32 {
    var FloatValue:Float{
        return Float(self)
    }
}

extension Int {
    var CGFloatValue:CGFloat{
        return CGFloat(self)
    }
}

extension CGFloat {
    var IntValue:Int{
        return Int(self)
    }
}

