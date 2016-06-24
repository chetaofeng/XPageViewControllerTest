//
//  BtnExtension.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/24.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

extension UIButton {
    public override class func initialize() {
        struct once {
            static var once:dispatch_once_t = 0
        }
        dispatch_once(&once.once) {
            let origionMethod = #selector(UIButton.sendAction(_:to:forEvent:))
            let myMethod = #selector(UIButton.myBtnClicked(_:to:forEvent:))
            
            let original = class_getInstanceMethod(self, origionMethod)
            let mine = class_getInstanceMethod(self, myMethod)
            
            let didAddMethod = class_addMethod(self, origionMethod, method_getImplementation(mine), method_getTypeEncoding(mine))
            
            if didAddMethod {
                class_replaceMethod(self, myMethod, method_getImplementation(original), method_getTypeEncoding(original))
            }else{
                method_exchangeImplementations(original, mine)
            }
        }
    }
    
    //交换后的方法
    //可以找个storyboard添加按钮的点击事件，检查是否执行了替换后的本方法
    func myBtnClicked(action: Selector, to target: AnyObject?, forEvent event: UIEvent?) {
        print("swizzle Method")
        //进行不允许重复点击的限制
        //这种方法可以实现不重复点击，但是由于时通过sendAction实现，如果一个按钮有两个事件，则在响应第一个事件之后，第二个事件无机会响应，需改进
//        struct once {
//            static var loopSwitch:Bool = true
//        }
//        
//        if once.loopSwitch {
//            target?.performSelector(action, withObject: self)
//            once.loopSwitch = false
//            //延时操作打开开关,延时3s
//            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * NSEC_PER_SEC))  // 3 * 10的9次方
//            dispatch_after(delayTime, dispatch_get_main_queue(), {
//                once.loopSwitch = true
//            })
//        }else {
//            print("禁止点击")
//        }
        
        //改进如下
        struct once {
            static var loopSwitch:Dictionary<String,String> = [:]
        }
        
        if self.tag == 1000{ //通过tag标签启用此功能
            if once.loopSwitch[action.description] != "0" {//action.description将返回方法名
                target?.performSelector(action, withObject: self)
                once.loopSwitch[action.description] = "0"
                //延时操作打开开关,延时3s
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * NSEC_PER_SEC))  // 3 * 10的9次方
                dispatch_after(delayTime, dispatch_get_main_queue(), {
                    once.loopSwitch[action.description] = "1"
                })
            }else {
                print("禁止点击")
            }
        }else{
            target?.performSelector(action, withObject: self)
        }
    }
}

