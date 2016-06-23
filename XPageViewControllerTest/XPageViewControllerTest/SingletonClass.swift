//
//  SingletonClass.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/23.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class SingletonClass: NSObject {
    private override init() {} //私有化初始化方法
    
    //MARK: GCD的once方式创建单例   线程安全的，OC中使用
    class func shareDefault() -> SingletonClass {
        struct once {
            static var onceToken:dispatch_once_t = 0
            static var shareSingle:SingletonClass! = nil
        }
        dispatch_once(&once.onceToken) {
            once.shareSingle = SingletonClass()
        }
        return once.shareSingle
    }
    
    //MARK: 使用结构体返回单例
    class func shareDefault2() -> SingletonClass {
        struct single {
            static var singleDefault = SingletonClass()
        }
        return single.singleDefault
    }
    
    //MARK: 通过全局变量方式返回单例
    static let singelDefault3 = SingletonClass()
}
